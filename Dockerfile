# Dockerfile
# Use an official Python runtime as a parent image
FROM python:3.11-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container at /app
COPY requirements.txt .

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the current directory contents into the container at /app
COPY . .

# Make port 5000 available to the world outside this container
EXPOSE 5000

# Define environment variables (optional, can be overridden)
ENV APP_VERSION=1.0
ENV FLASK_APP=app.py

# Run app.py when the container launches using gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]