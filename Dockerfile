# Multi-stage Dockerfile for Student CRUD REST API

# === Stage 1: Build Stage ===
FROM python:3.12-slim AS builder

# Set working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# === Stage 2: Run Stage ===
FROM python:3.12-alpine

# Set environment variables
ENV PYTHONUNBUFFERED=1
ENV PATH="/usr/local/bin:$PATH"


# Set working directory
WORKDIR /app

# Copy installed dependencies from builder
COPY --from=builder /usr/local/lib/python3.12 /usr/local/lib/python3.12
COPY . .

# Expose the port Flask runs on
EXPOSE 5000

# Command to run the app
CMD ["python", "-m", "flask", "--app", "wsgi", "run", "--host=0.0.0.0", "--port=5000"]

