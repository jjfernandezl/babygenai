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

CMD ["python", "src/main.py"]