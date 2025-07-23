FROM python:3.9.22-slim

WORKDIR /app

# Copy requirements and install
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copy source code
COPY src/ ./src/
COPY .env .

# Set environment variable for container
ENV DMR_BASE_URL=http://model-runner.docker.internal

# Use a non-root user for better security
RUN useradd --no-log-init -r -m appuser
USER appuser

CMD ["python", "src/main.py"]