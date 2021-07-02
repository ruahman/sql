SHELL=/bin/bash

name = postgres
network = $(name)-net
password = RuahMan773!
volume = postgresVolume

.PHONY: build
build:
	@echo build 

.PHONY: network
network:
	@if [[ "$(shell docker network inspect $(network) 2> /dev/null)" == "[]" ]]; then \
		docker network create $(network); \
	else \
		echo "network: $(network) is already setup"; \
	fi

.PHONY: run
run: build network
	docker run --name $(name) --network $(network) -v $(volume):/var/lib/postgresql/data -e POSTGRES_PASSWORD=$(password) -d postgres

.PHONY: shell
shell: build network
	docker run -it --rm --network $(network) -v /home/ruahman/Projects/postgres/sql/:/scripts/ postgres psql -h $(name) -U postgres

.PHONY: stop
stop:
	docker stop $(name) 

.PHONY: rm
rm:
	docker rm $(name)

.PHONY: rmi
rmi:
	docker rmi $(name)
