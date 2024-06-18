
include env.mk

scan-code:
	docker run \
		--rm \
		-e "SONAR_TOKEN=$(SONAR_TOKEN)" \
		-v "$(shell pwd):/usr/src" \
		sonarsource/sonar-scanner-cli
