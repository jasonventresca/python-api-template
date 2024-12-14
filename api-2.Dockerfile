FROM local/base:latest

ENV APP_NAME=api-2

# Expose the port FastAPI runs on
EXPOSE 8001

# Command to run the application
CMD \
    dev_opts=""; \
    if [ "$MODE" = "development" ]; then \
        # In development mode, use uvicorn with reload flag
        dev_opts="--reload"; \
    fi ; \
    uvicorn main:app --host 0.0.0.0 --port 8001 ${dev_opts}