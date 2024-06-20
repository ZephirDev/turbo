#
# List CMakeLists that holds library and executable inside CMAKE_FILES.
# The scripts is gonna clean the CMakeList to avoid the sources list on single line.
#
CMAKE_FILES+=modules/kernel/CMakeLists.txt
CMAKE_FILES+=modules/kernel/tests/CMakeLists.txt

NAMESPACE=turbo-workspace
WORKSPACE_EXEC=/snap/bin/microk8s kubectl exec -n $(NAMESPACE) $(shell /snap/bin/microk8s kubectl get pods -n $(NAMESPACE) -o name | egrep workspace) --

include env.mk

scan-code:
	$(WORKSPACE_EXEC) /bin/bash -c "mkdir -p /tmp/reports"
	$(WORKSPACE_EXEC) /bin/bash -c "cd /tmp/turbo/cmake-build-debug-remote-host; for file in \$$(find . -type f -name "cppcheck-results.xml"); do mkdir -p /tmp/reports/cppcheck/\$$(dirname \$$file); cp -v \$$file /tmp/reports/cppcheck/\$$file; done"
	$(WORKSPACE_EXEC) /bin/bash -c "cp -Rv /tmp/turbo/cmake-build-debug-remote-host/reports/* /tmp/reports"
	$(WORKSPACE_EXEC) /bin/bash -c "cd /tmp/turbo; gcovr -r . ./cmake-build-debug-remote-host --xml /tmp/reports/coverage.xml"
	docker run \
		--rm \
		-e "SONAR_TOKEN=$(SONAR_TOKEN)" \
		-v "$(shell pwd):/usr/src" \
		-v "/mnt/turbo/workspace/cache:/workspace/cache" \
		sonarsource/sonar-scanner-cli

prettify-cmakelist:
	python3 ./scripts/prettify-cmake.py $(CMAKE_FILES)

prettify: prettify-cmakelist
