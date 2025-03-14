# Makefile for Student CRUD REST API

.PHONY: run migrate upgrade test docker-build docker-run docker-clean

# Run the application
run:
	flask --app wsgi run --host=0.0.0.0 --port=5000

# Initialize migrations
migrate:
	flask db migrate -m "Create student table"

# Upgrade database (apply migrations)
upgrade:
	flask db upgrade

# Run tests (placeholder)
test:
	python -m unittest discover -s tests

# Docker-related variables
VERSION ?= 1.0.0
IMAGE_NAME = student-api

# Build Docker image with proper tagging
docker-build:
	docker build -t $(IMAGE_NAME):$(VERSION) .

# Run Docker container with environment variables
docker-run:
	docker run -d -p 5000:5000 --env DATABASE_URL=sqlite:///students.db $(IMAGE_NAME):$(VERSION)

# Clean Docker images
docker-clean:
	docker rmi $(IMAGE_NAME):$(VERSION)

# Clean up temporary files
clean:
	rm -rf __pycache__ *.pyc *.pyo .pytest_cache

# Show available targets
help:
	@echo "Available targets:"
	@echo "  run           - Run the Flask application"
	@echo "  migrate       - Create database migrations"
	@echo "  upgrade       - Apply database migrations"
	@echo "  test          - Run unit tests"
	@echo "  docker-build  - Build Docker image with version tagging"
	@echo "  docker-run    - Run Docker container with environment variables"
	@echo "  docker-clean  - Remove Docker image"
	@echo "  clean         - Remove temporary files"

# Start DB container
docker-db:
	docker compose up -d db

# Run database migrations
docker-migrate:
	docker compose run --rm api flask db upgrade

# Build and start API
docker-up:
	docker compose up --build -d

# Stop and remove all containers
docker-down:
	docker compose down

