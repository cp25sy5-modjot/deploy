local:
	docker compose -f docker-compose.local.yml up --build -d
local-down:
	docker compose -f docker-compose.local.yml down

dev:
	docker compose -f docker-compose.dev.yml up --build -d
dev-down:
	docker compose -f docker-compose.dev.yml down

# --- Production (pull prebuilt image from GHCR) ---
prod:
	docker compose -f docker-compose.prod.yml pull
	docker compose -f docker-compose.prod.yml up -d --no-build
prod-down:
	docker compose -f docker-compose.prod.yml down

clear:
	docker system prune -a --volumes -f