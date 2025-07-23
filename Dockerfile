FROM python:3.9.22-slim

WORKDIR /app

# Copy requirements and install
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copy source code
COPY src/ ./src/
RUN chown -R appuser:appuser /app

# Set environment variable for container
ENV DMR_BASE_URL=http://model-runner.docker.internal

# Switch to non-root user
USER appuser

CMD ["python", "src/main.py"]