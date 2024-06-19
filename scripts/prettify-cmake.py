import sys
import re

class PrettifyCmake:

    def execute_on_files(self, files):
        for file in files:
            fd = open(file, "r")
            lines = fd.readlines()
            fd.close()

            lines = "".join(lines)
            lines = self.execute(lines)

            fd = open(file, "w")
            fd.write(lines)
            fd.close()

    def execute(self, lines):
        lines = self.prettify_content(lines)
        return lines

    def prettify_content(self, lines):
        target_re = re.compile(r" *(add_library|target_link_libraries|add_executable) *\([^)]+\) *", re.MULTILINE)
        details_re = re.compile(r"^(add_library|target_link_libraries|add_executable) *\(([^)]+)\) *", re.MULTILINE)
        r=""
        at=0

        for match in target_re.finditer(lines):
            r += lines[at:match.start()]
            rework = lines[match.start():match.end()]
            rework_match = details_re.match(rework)
            target = rework_match.group(1)
            parameters = []
            for line in rework_match.group(2).split("\n"):
                parameters.extend(line.strip().split(" "))

            if target in ["add_executable", "target_link_libraries"]:
                r += target + "(" + parameters[0] + "\n  "
                s = parameters[1:]
                s.sort()
                r += "\n  ".join(s)
                r += ")"
            elif target == "add_library":
                r += "add_library(" + parameters[0] + " " + parameters[1] + "\n  "
                s = parameters[2:]
                s.sort()
                r += "\n  ".join(s)
                r += ")"
            else:
                raise "Unknown %s target" % target

            at = match.end() + 1
            r += "\n"

        r += lines[at:]
        return r

if __name__ == '__main__':
    prettifier = PrettifyCmake()
    prettifier.execute_on_files(sys.argv[1:])