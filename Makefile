BUILD_NAME=php
COMPOSE_BUILD_NAME=php-container
VERSIONS=7.4 7.3 7.2 7.1
LATEST=$(firstword $(VERSIONS))
ALL=$(addprefix php,$(VERSIONS))
VCS_REF="$(shell git rev-parse HEAD)"
BUILD_DATE="$(shell date -u +"%Y-%m-%dT%H:%m:%SZ")"
DOCKERHUB_USER=groovytron

.PHONY: all
all: $(ALL)

.PHONY: $(ALL)
$(ALL):
	BUILD_DATE=$(BUILD_DATE) \
	BUILD_NAME=$(BUILD_NAME) \
	COMPOSE_BUILD_NAME=$(COMPOSE_BUILD_NAME) \
	VCS_REF=$(VCS_REF) \
	docker-compose -f build.yml build \
		$@

.PHONY:clean
clean:
	for VERSION in $(VERSIONS); do \
		docker image rm -f $(COMPOSE_BUILD_NAME):$$VERSION; \
	done

.PHONY:publish-docker-images
publish-docker-images:
	for VERSION in $(VERSIONS); do \
		docker tag $(COMPOSE_BUILD_NAME):$$VERSION $(DOCKERHUB_USER)/$(BUILD_NAME):$$VERSION-$(VCS_REF) && \
		docker push $(DOCKERHUB_USER)/$(BUILD_NAME):$$VERSION-$(VCS_REF) && \
		docker tag $(COMPOSE_BUILD_NAME):$$VERSION $(DOCKERHUB_USER)/$(BUILD_NAME):$$VERSION && \
		docker push $(DOCKERHUB_USER)/$(BUILD_NAME):$$VERSION; \
	done && \
	docker tag $(COMPOSE_BUILD_NAME):$(LATEST) $(DOCKERHUB_USER)/$(BUILD_NAME):latest && \
	docker push $(DOCKERHUB_USER)/$(BUILD_NAME):latest
