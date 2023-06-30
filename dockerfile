FROM python:3.10.11-alpine

# Set the working directory in the container
WORKDIR /app

ENV SLACK_BOT_TOKEN=${SLACK_BOT_TOKEN}
ENV SLACK_SIGNING_SECRET=${SLACK_SIGNING_SECRET}
ENV SLACK_BOT_USER_ID=${SLACK_BOT_USER_ID}
ENV OPENAI_API_KEY=${OPENAI_API_KEY}

# Copy the requirements file into the container
COPY requirements.txt .

# Install the dependencies
RUN apk update && apk add build-base
RUN apk upgrade --update-cache --available && \
    apk add openssl && \
    rm -rf /var/cache/apk/*
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code into the container
COPY . .

RUN addgroup -g 1001 -S appuser && adduser -u 1001 -S appuser -G appuser
RUN chown -R appuser:appuser /app

USER appuser

# Expose the port on which the Flask app will run
EXPOSE 5000

# Run the command to start the Flask application
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:flask_app"]
