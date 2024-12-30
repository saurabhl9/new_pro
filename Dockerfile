# Use an official Python image as the base
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy application code and requirements to the container
COPY app.py requirements.txt /app/

RUN apt update
RUN apt install python3-pip -y
# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt
RUN pip3 install Flask

# Expose the port that the app will run on
EXPOSE 5000

# Command to run the application
CMD ["python", "app.py","-m","flask","run","--host=0.0.0.0"]
