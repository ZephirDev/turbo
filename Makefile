#
# List CMakeLists that holds library and executable inside CMAKE_FILES.
# The scripts is gonna clean the CMakeList to avoid the sources list on single line.
#
CMAKE_FILES+=modules/kernel/CMakeLists.txt
CMAKE_FILES+=modules/kernel/tests/CMakeLists.txt

include env.mk

ln-reports-dir-with-clion-dirs:
	ln -s cmake-build-debug-remote-host/reports ./reports

scan-code:
	docker run \
		--rm \
		-e "SONAR_TOKEN=$(SONAR_TOKEN)" \
		-v "$(shell pwd):/usr/src" \
		sonarsource/sonar-scanner-cli

prettify-cmakelist:
	python3 ./scripts/prettify-cmake.py $(CMAKE_FILES)

prettify: prettify-cmakelist
