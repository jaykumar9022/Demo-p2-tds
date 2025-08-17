# Use lightweight official Python image
FROM python:3.9-slim-buster

# Set working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy app code
COPY . .

# Cloud Run automatically sets $PORT
ENV PORT=8080

# Expose port (optional but good practice)
EXPOSE 8080

# Start FastAPI app with Uvicorn
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]
