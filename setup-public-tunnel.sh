#!/bin/bash

echo "🌐 Setting up Public Tunnel with ngrok"
echo "======================================"

# Check if ngrok is installed
if ! command -v ngrok &> /dev/null; then
    echo "❌ ngrok not found. Installing..."
    curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc | sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null
    echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | sudo tee /etc/apt/sources.list.d/ngrok.list
    sudo apt update && sudo apt install ngrok
fi

echo "✅ ngrok is installed"

# Check if VS Code Server is running
if ! curl -s http://localhost:8080 >/dev/null 2>&1; then
    echo "⚠️  VS Code Server is not running on port 8080"
    echo "   Starting VS Code Server..."
    ./start-vscode-server.sh &
    sleep 5
fi

echo "✅ VS Code Server is running"

echo ""
echo "🔑 Next Steps:"
echo "=============="
echo ""
echo "1. Get your authtoken from https://ngrok.com"
echo "2. Run: ngrok config add-authtoken YOUR_AUTHTOKEN"
echo "3. Start public tunnel: ngrok http 8080"
echo "4. Use the HTTPS URL from ngrok in your Android browser"
echo ""
echo "📱 You'll be able to access VS Code from anywhere in the world!"
echo ""
echo "🚀 Ready to create your public tunnel!"
