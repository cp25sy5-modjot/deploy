local:
	docker compose -f docker-compose.local.yml up --build -d
local-down:
	docker compose -f docker-compose.local.yml down
dev:
	docker compose -f docker-compose.dev.yml up --build -d
dev-down:
	docker compose -f docker-compose.dev.yml down
prod:
	docker compose -f docker-compose.prod.yml up --build -d
prod-down:
	docker compose -f docker-compose.prod.yml down
