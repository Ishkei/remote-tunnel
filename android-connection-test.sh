#!/bin/bash

echo "📱 Android Connection Test"
echo "=========================="

# Get current IP
IP=$(hostname -I | awk '{print $1}')
echo "📍 Your IP Address: $IP"
echo "👤 Username: soto"
echo "🔒 SSH Port: 22"
echo ""

# Test SSH connection
echo "🔍 Testing SSH connection..."
if ssh -o ConnectTimeout=5 -o StrictHostKeyChecking=no localhost "echo 'SSH connection successful'" >/dev/null 2>&1; then
    echo "✅ SSH connection working"
else
    echo "❌ SSH connection failed"
    exit 1
fi

echo ""
echo "📱 Android Connection Commands:"
echo "================================"
echo ""
echo "1. Termux SSH:"
echo "   ssh soto@$IP"
echo ""
echo "2. VS Code Server (web browser):"
echo "   http://$IP:8080"
echo ""
echo "3. With compression (faster):"
echo "   ssh -C soto@$IP"
echo ""
echo "4. Auto-reconnect script:"
echo "   while true; do ssh soto@$IP; sleep 5; done"
echo ""
echo "🔧 To start VS Code Server:"
echo "   ./start-vscode-server.sh"
echo ""
echo "🌐 For public access:"
echo "   ngrok tcp 22    # For SSH"
echo "   ngrok http 8080 # For VS Code Server"
echo ""
echo "✅ Your Android development environment is ready!"
