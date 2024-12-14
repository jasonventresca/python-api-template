FROM local/base:latest

ENV APP_NAME=api-1

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