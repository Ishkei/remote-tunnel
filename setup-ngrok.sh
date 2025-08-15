#!/bin/bash

echo "🚀 Setting up ngrok for public tunnel access..."

# Install ngrok
if ! command -v ngrok &> /dev/null; then
    echo "📦 Installing ngrok..."
    curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc | sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null
    echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | sudo tee /etc/apt/sources.list.d/ngrok.list
    sudo apt update && sudo apt install -y ngrok
    echo "✅ ngrok installed"
else
    echo "✅ ngrok already installed"
fi

# Create ngrok config
mkdir -p ~/.config/ngrok
cat > ~/.config/ngrok/ngrok.yml << 'NGROKCONFIG'
version: "2"
authtoken: ""
tunnels:
  ssh:
    proto: tcp
    addr: 22
    bind_tls: false
NGROKCONFIG

echo "✅ ngrok config created"
echo ""
echo "📝 To use ngrok:"
echo "   1. Get a free account at https://ngrok.com"
echo "   2. Add your authtoken to ~/.config/ngrok/ngrok.yml"
echo "   3. Run: ngrok start ssh"
echo ""
echo "🌐 This will give you a public URL to connect from anywhere!"
