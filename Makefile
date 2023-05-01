.DEFAULT_GOAL:=help

#============================================================================

## Start all components including application, monitoring and logging stacks.
all:
	@docker-compose up -d --build
.PHONY: all

## Tail all logs with -n 10.
logs:
	@docker-compose logs --follow --tail=10
.PHONY: logs

## Stop all components.
stop:
	@docker-compose stop
.PHONY: stop

## Start all stopped components.
start:
	@docker-compose start
.PHONY: start

## Restart all components.
restart:
	@docker-compose restart
.PHONY: restart

## Remove all stopped components containers.
rm:
	@docker-compose rm -f
.PHONY: rm

## Down all components.
down:
	@docker-compose down
.PHONY: down

## List all images of components.
images:
	@docker-compose images
.PHONY: images

## List all component containers.
ps:
	@docker-compose ps
.PHONY: ps

## Remove all containers and delete volume
prune:
	@make stop && make rm
	@docker volume prune -f
.PHONY: prune

## Show this help.
help:
	@echo "\nMake Application using Docker-Compose files."
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m (default: help)\n\nTargets:\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-12s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)
