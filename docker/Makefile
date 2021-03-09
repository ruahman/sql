SHELL=/bin/bash

name = mssql
ports = 1433:1433
volume = mssqlVolume
password = RuahMan773!

ifndef network
	network=mssql-net
endif

.PHONY: build
build:
	@if [[ "$(shell docker images -q $(name) 2> /dev/null)" == "" ]]; then \
		docker build -t $(name) .; \
	else \
		echo "image: $(name) is already setup"; \
	fi

.PHONY: network
network:
	@if [[ "$(shell docker network inspect $(network) 2> /dev/null)" == "[]" ]]; then \
		docker network create $(network); \
	else \
		echo "network: $(network) is already setup"; \
	fi

.PHONY: run
run: build network 
	docker container run --name $(name) --network=$(network) -e SA_PASSWORD=$(password) -v $(volume):/var/opt/mssql -p $(ports) -d $(name)
	@echo mssm: 127.0.0.1:1433 sa/RuahMan773!

.PHONY: shell
shell:  
	docker exec -it mssql sqlcmd -S localhost -U SA -P '$(password)'

.PHONY: stop
stop:
	docker container stop $(name)

.PHONY: start
start:
	docker container start $(name)

.PHONY: rm
rm:
	docker container rm $(name)

.PHONY: rmi
rmi:
	docker rmi $(name)

.PHONY: rmv
rmv:
	docker volume rm $(volume)

.PHONY: cp
cp:
	docker cp AdventureWorks2019.bak $(name):/var/opt/mssql
	docker cp WideWorldImporters-Full.bak $(name):/var/opt/mssql