# Use a base image with Python pre-installed
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements.txt file to the container
COPY requirements.txt .

# Install the Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the main.py file to the container
COPY main.py .

# Copy the .env file to the container
COPY .env .

# Set the environment variable for the OpenAI API key
ENV OPENAI_API_KEY=<your_api_key>

# Expose the port on which the Streamlit app will run (default is 8501)
EXPOSE 8501

# Run the Streamlit app when the container starts
CMD ["streamlit", "run", "main.py", "--server.port", "8501"]