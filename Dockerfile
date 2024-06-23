# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the current directory contents into the container at /usr/src/app
COPY . .

# Install mkdocs and any other dependencies
RUN pip install --no-cache-dir mkdocs

# Run mkdocs build to generate the static site
RUN mkdocs build

# Expose the port mkdocs runs on
EXPOSE 8000

# Start mkdocs serve to serve the built site
CMD ["mkdocs", "serve", "--dev-addr=0.0.0.0:8000"]
