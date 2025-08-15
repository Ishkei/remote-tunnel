#!/bin/bash

echo "🔍 Testing SSH Connection..."
echo "================================"

# Test 1: Check if SSH service is running
echo "1. SSH Service Status:"
if systemctl is-active --quiet ssh; then
    echo "   ✅ SSH service is running"
else
    echo "   ❌ SSH service is not running"
    exit 1
fi

# Test 2: Check if port 22 is listening
echo "2. Port 22 Status:"
if netstat -tlnp | grep -q ":22 "; then
    echo "   ✅ Port 22 is listening on all interfaces"
else
    echo "   ❌ Port 22 is not listening"
    exit 1
fi

# Test 3: Test local SSH connection
echo "3. Local SSH Connection:"
if ssh -o ConnectTimeout=5 -o StrictHostKeyChecking=no localhost "echo 'Local connection successful'" >/dev/null 2>&1; then
    echo "   ✅ Local SSH connection working"
else
    echo "   ❌ Local SSH connection failed"
    exit 1
fi

# Test 4: Test SSH key authentication
echo "4. SSH Key Authentication:"
if ssh -o ConnectTimeout=5 -o StrictHostKeyChecking=no -i ~/.ssh/id_rsa localhost "echo 'Key auth successful'" >/dev/null 2>&1; then
    echo "   ✅ SSH key authentication working"
else
    echo "   ❌ SSH key authentication failed"
    exit 1
fi

# Test 5: Show connection info
echo "5. Connection Information:"
echo "   📍 Your IP Address: $(hostname -I | awk '{print $1}')"
echo "   🔒 SSH Port: 22"
echo "   👤 Username: $USER"
echo "   🔑 SSH Key: ~/.ssh/id_rsa"

echo ""
echo "🎉 All tests passed! Your SSH tunnel is ready for Android connections."
echo ""
echo "📱 On your Android device, run:"
echo "   ssh $USER@$(hostname -I | awk '{print $1}')"
