FROM python:3.12-slim

# Create working directory
WORKDIR /app

# Install dependencies first (better caching)
COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

# Expose container port
EXPOSE 5000

# Use gunicorn as the entrypoint
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
