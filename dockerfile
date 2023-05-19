FROM python:3.10.11-slim-bullseye

RUN apt-get update && apt-get install -y 
# Set the working directory in the container
WORKDIR /app

ENV SLACK_BOT_TOKEN=${SLACK_BOT_TOKEN}
ENV SLACK_SIGNING_SECRET=${SLACK_SIGNING_SECRET}
ENV SLACK_BOT_USER_ID=${SLACK_BOT_USER_ID}
ENV OPENAI_API_KEY=${OPENAI_API_KEY}

# Copy the requirements file into the container
COPY requirements.txt .

# Install the dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code into the container
COPY . .

RUN groupadd -r appuser && useradd -r -g appuser appuser
RUN chown -R appuser:appuser /app

# Expose the port on which the Flask app will run
EXPOSE 5000

# Run the command to start the Flask application
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:flask_app"]
