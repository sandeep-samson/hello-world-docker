# Use an official Python runtime as a parent image
FROM python:3

# Set working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any dependencies specified in requirements.txt
# RUN pip install --no-cache-dir -r requirements.txt

# Make port 80 available to the world outside this container
EXPOSE 80

# Define evvironment variable
ENV NAME World

# Run app.py when the container launches
CMD ["python", "app.py"]
