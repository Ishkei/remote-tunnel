#!/bin/bash

echo "🚀 Starting VS Code Server for Android access..."
echo "================================================"

# Check if code-server is installed
if ! command -v code-server &> /dev/null; then
    echo "❌ code-server not found. Installing..."
    curl -fsSL https://code-server.dev/install.sh | sh
fi

# Create VS Code Server config directory
mkdir -p ~/.config/code-server

# Create config file
cat > ~/.config/code-server/config.yaml << EOF
bind-addr: 0.0.0.0:8080
auth: none
password: 
cert: false
EOF

echo "✅ VS Code Server configuration created"

# Start VS Code Server
echo "🌐 Starting VS Code Server on port 8080..."
echo "📱 Access from Android: http://$(hostname -I | awk '{print $1}'):8080"
echo "🔗 Or use ngrok for public access: ngrok http 8080"
echo ""
echo "Press Ctrl+C to stop the server"
echo "================================================"

code-server --bind-addr 0.0.0.0:8080 --auth none
