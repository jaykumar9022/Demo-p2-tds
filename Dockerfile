# Stage 1: Build Stage (for installing dependencies)
FROM python:3.9-slim-buster

WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Stage 2: Application Stage (copying actual code)
COPY . .

# Expose the port that the application will listen on.
EXPOSE 8080

# Command to run FastAPI with Uvicorn (exec form ✅ no warning)
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]
