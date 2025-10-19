

DATA_DIR = /home/${USER}/data
WP_FILES = $(DATA_DIR)/wordpress-data
DB_FILES = $(DATA_DIR)/mariadb-data

all: setup up

setup:
	mkdir -p $(WP_FILES)
	mkdir -p $(DB_FILES)

up: 
	@docker compose -f ./docker-compose.yml up -d

down: 
	@docker compose -f ./docker-compose.yml down

stop: 
	@docker compose -f ./docker-compose.yml stop

start: 
	@docker compose -f ./docker-compose.yml start

status: 
	@docker ps

re: setup
	docker compose -f ./docker-compose.yml down -v --rmi all
	docker compose -f ./docker-compose.yml up  --build -d

