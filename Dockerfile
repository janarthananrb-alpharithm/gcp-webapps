# Use the official Python image from the Docker Hub
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt /app/requirements.txt

# Install the dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application files into the container
COPY . /app

# Set the environment variable for Flask to run in production mode
ENV FLASK_APP=main.py
ENV FLASK_ENV=production

# Expose the port Flask will run on
EXPOSE 8080

# Run the application with Gunicorn (production server)
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "main:app"]

