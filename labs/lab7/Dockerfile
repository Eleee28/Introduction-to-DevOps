# Derive container from Python
FROM python:3.13

# Create the working directory
WORKDIR /app

# Copy Flask app into the container
COPY hello.py .

# Install Flask
RUN pip install flask

# Expose Flask port
EXPOSE 5000

# Set the Flask app name
ENV FLASK_APP=hello.py

# Run the application
CMD ["flask", "run", "--host=0.0.0.0"]
