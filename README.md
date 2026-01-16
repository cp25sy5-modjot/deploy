# 🚀 Deploy Guide

This repository provides a simple deployment system using **Makefile** and **Docker Compose**.  
It supports three deployment modes: **Local**, **Development**, and **Production**.

---

## 🧪 Development Deployment

> Use this mode for **development or staging environments** where you **don’t have all repositories locally**.  
> Docker will automatically **pull prebuilt images** tagged with `:dev`.

### Run
```bash
make dev
```

### Stop
```bash
make dev-down
```

🟡 **Note:** All services will use images from the remote registry tagged as `:dev`.

---

## 🏭 Production Deployment

> Use this mode for **production servers or VMs**.  
> Docker will automatically **pull prebuilt images** tagged with `:latest`.

### Run
```bash
make prod
```

### Stop
```bash
make prod-down
```

🔵 **Note:** All services will use images from the remote registry tagged as `:latest`.

---

## 💡 Summary

| Mode | Start Command | Stop Command | Description | Image Tag |
|------|----------------|---------------|--------------|------------|
| **Development** | `make dev` | `make dev-down` | Pull images for development/testing | `:dev` |
| **Production** | `make prod` | `make prod-down` | Pull images for production deployment | `:latest` |

---

## 🧰 Prerequisites

- **Docker** and **Docker Compose**
- **Make** utility (comes preinstalled on most UNIX systems)
- Access to the image registry for `:dev` and `:latest` tags

---

## 📄 Example Makefile

Here’s an example snippet you can include in your `Makefile`:

```makefile
dev:
	docker compose -f compose.dev.yml up -d

dev-down:
	docker compose -f compose.dev.yml down

prod:
	docker compose -f compose.prod.yml up -d

prod-down:
	docker compose -f compose.prod.yml down
```

---

## 🧠 Tips

- Always verify your `.env` file before deployment.
- Use `docker compose ps` to check running services.
- Use `docker compose logs -f <service>` to view logs in real-time.
- You can extend the `Makefile` with additional commands for migrations or health checks.

---

## Command for create database migration files
migrate create -ext sql -dir db/migrations -seq scriptname\n         
© 2025 — Deployment Automation by [Your Team Name]
