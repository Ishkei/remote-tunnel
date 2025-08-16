#!/bin/bash

echo "🚀 Setting up Cursor Remote SSH Tunnel"
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
echo "🔑 Current Tunnel Status:"
echo "========================"

# Check current tunnels
if curl -s http://127.0.0.1:4040/api/tunnels >/dev/null 2>&1; then
    echo "✅ HTTP Tunnel (VS Code Server) is active"
    HTTP_URL=$(curl -s http://127.0.0.1:4040/api/tunnels | python3 -c "import sys, json; data=json.load(sys.stdin); [print(t['public_url']) for t in data['tunnels'] if t['proto'] == 'https']" 2>/dev/null)
    if [ ! -z "$HTTP_URL" ]; then
        echo "   📱 VS Code Server: $HTTP_URL"
    fi
else
    echo "❌ No tunnels active"
fi

echo ""
echo "🎯 Cursor Remote SSH Options:"
echo "============================="
echo ""
echo "Option 1: Use VS Code Server (Already Working!)"
echo "   - Open your browser and go to the URL above"
echo "   - Full VS Code experience from anywhere"
echo "   - No Cursor installation needed"
echo ""
echo "Option 2: Set up SSH Tunnel for Cursor Remote SSH"
echo "   - Requires stopping VS Code Server tunnel"
echo "   - Gives you full Cursor experience"
echo "   - But loses web-based access"
echo ""
echo "Option 3: Hybrid Setup (Requires ngrok Pro)"
echo "   - Run both tunnels simultaneously"
echo "   - Best of both worlds"
echo "   - Requires paid ngrok account"
echo ""

echo "🚀 Recommendations:"
echo "=================="
echo ""
echo "1. For now, use VS Code Server (Option 1) - it's already working!"
echo "2. If you want full Cursor experience, we can switch to SSH tunnel"
echo "3. For both, consider upgrading to ngrok Pro"
echo ""

echo "What would you like to do?"
echo "1. Keep using VS Code Server (current setup)"
echo "2. Switch to SSH tunnel for Cursor Remote SSH"
echo "3. Learn more about the differences"
