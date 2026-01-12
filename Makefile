prod:
	docker compose -f docker-compose.prod.yml pull
	docker compose -f docker-compose.prod.yml up -d --no-build
prod-down:
	docker compose -f docker-compose.prod.yml down

clean:
	docker system prune -a --volumes -f