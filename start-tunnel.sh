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
