#!/bin/bash
echo "Starting Ollama server in background..."
/bin/ollama serve &

# Wait for the server to start
sleep 5

echo "Creating the custom model from Modelfile..."
# The Modelfile is located at /app/Modelfile inside the container
ollama create modjot-ai -f /app/Modelfile

echo "Model created. Keeping container alive."
# Wait for the background ollama serve process to finish
wait
