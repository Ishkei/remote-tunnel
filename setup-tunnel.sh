#!/bin/bash

# Remote Tunnel Setup Script for Cursor on Android
# This script sets up an SSH tunnel with port forwarding for remote development

set -e

echo "🚀 Setting up Remote Tunnel for Cursor on Android..."

# Check if SSH server is running
if ! systemctl is-active --quiet ssh; then
    echo "📡 Installing and starting SSH server..."
    sudo apt update
    sudo apt install -y openssh-server
    sudo systemctl enable ssh
    sudo systemctl start ssh
    echo "✅ SSH server is now running"
else
    echo "✅ SSH server is already running"
fi

# Get current IP address
LOCAL_IP=$(hostname -I | awk '{print $1}')
echo "📍 Your local IP address: $LOCAL_IP"

# Check if we're behind a router (common case)
if [[ $LOCAL_IP == 192.168.* ]] || [[ $LOCAL_IP == 10.* ]] || [[ $LOCAL_IP == 172.* ]]; then
    echo "⚠️  You appear to be behind a router. You'll need to:"
    echo "   1. Forward port 22 (SSH) to this machine in your router settings"
    echo "   2. Use your public IP address to connect from Android"
    echo "   3. Or use a service like ngrok for easier access"
fi

# Create SSH key if it doesn't exist
if [ ! -f ~/.ssh/id_rsa ]; then
    echo "🔑 Generating SSH key..."
    ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa -N ""
    echo "✅ SSH key generated"
fi

# Set up SSH config for easier connection
mkdir -p ~/.ssh
cat > ~/.ssh/config << 'SSHCONFIG'
Host android-tunnel
    HostName localhost
    User $USER
    Port 22
    IdentityFile ~/.ssh/id_rsa
    ServerAliveInterval 60
    ServerAliveCountMax 3
SSHCONFIG

echo "✅ SSH config created"

# Create a simple tunnel script
cat > start-tunnel.sh << 'TUNNELSCRIPT'
#!/bin/bash

echo "🌐 Starting SSH tunnel for Cursor remote access..."
echo "📱 On your Android device, you can now:"
echo "   1. Install a terminal app (like Termux)"
echo "   2. Connect via SSH: ssh $USER@$(hostname -I | awk '{print $1}')"
echo "   3. Or use your public IP if you've set up port forwarding"
echo ""
echo "🔒 SSH is running on port 22"
echo "📊 To check connections: sudo netstat -tlnp | grep :22"
echo ""
echo "Press Ctrl+C to stop the tunnel"

# Keep the script running and show connection info
while true; do
    echo "🔄 Tunnel active - $(date)"
    sleep 30
done
TUNNELSCRIPT

chmod +x start-tunnel.sh

echo "✅ Remote tunnel setup complete!"
echo ""
echo "📁 Files created in: $(pwd)/"
echo "🚀 To start the tunnel, run: ./start-tunnel.sh"
echo ""
echo "📱 On your Android device, you can now connect via SSH!"
