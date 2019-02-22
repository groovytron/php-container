BUILD_NAME=php-container
CONTAINER_NAME=my-php-container
COMMON_BUILD_TAGS=--build-arg VCS_REF="$(shell git rev-parse HEAD)" --build-arg BUILD_DATE="$(shell date -u +"%Y-%m-%dT%H:%m:%SZ")"

.PHONY: all
all: 7.2

.PHONY: 7.%
7.%: Dockerfile
	docker build \
		$(COMMON_BUILD_TAGS) \
		--build-arg PHP_VERSION=$@ \
		--tag $(BUILD_NAME):$@ .

.PHONY:clean
clean:
	for VERSION in '7.2' '7.1'; do \
		docker image rm -f $(BUILD_NAME):$$VERSION; \
	done
