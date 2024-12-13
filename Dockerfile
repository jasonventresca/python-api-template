# Use official Python image as the base
FROM python:3.12-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set the working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY . .

# Expose the port FastAPI runs on
EXPOSE 8000

# Command to run the application
CMD \
    dev_opts=""; \
    if [ "$MODE" = "development" ]; then \
        # In development mode, use uvicorn with reload flag
        dev_opts="--reload"; \
    fi ; \
    uvicorn main:app --host 0.0.0.0 --port 8000 ${dev_opts}