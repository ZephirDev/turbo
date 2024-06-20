find_program(CMAKE_CXX_CPPCHECK NAMES cppcheck)
if (CMAKE_CXX_CPPCHECK)
    message("-- cppcheck is detected")
    list(
            APPEND CMAKE_CXX_CPPCHECK
            "-v"
            "--enable=all"
            "--inconclusive"
            "--force"
            "--inline-suppr"
            "--xml"
            "--output-file=./cppcheck-results.xml"
    )
else ()
    message("-- cppcheck is not installed")
endif()