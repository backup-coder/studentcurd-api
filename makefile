# Makefile for Student CRUD REST API

.PHONY: run migrate upgrade test

# Run the application
run:
	flask --app wsgi run --host=0.0.0.0 --port 5000

# Initialize migrations
migrate:
	flask db migrate -m "Create student table"

# Upgrade database (apply migrations)
upgrade:
	flask db upgrade

# Run tests (placeholder)
test:
	python -m unittest discover -s tests

# Clean up
clean:
	rm -rf __pycache__ *.pyc *.pyo .pytest_cache

# Help
help:
	@echo "Available targets:"
	@echo "  run      - Run the Flask application"
	@echo "  migrate  - Create database migrations"
	@echo "  upgrade  - Apply database migrations"
	@echo "  test     - Run unit tests"
	@echo "  clean    - Remove temporary files"


