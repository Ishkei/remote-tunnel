# 🚀 Remote Tunnel Connection Guide for Cursor on Android

## ✅ Current Status
- SSH server is running on port 22
- Your IP address: 100.115.92.205
- SSH keys generated and configured
- Ready for remote connections!

## 📱 Android Setup Instructions

### Step 1: Install Termux
1. Download **Termux** from F-Droid (recommended) or Google Play Store
2. Open Termux and grant necessary permissions

### Step 2: Connect via SSH
```bash
# In Termux, run:
ssh soto@100.115.92.205
```

### Step 3: Install Development Tools in Termux
```bash
# Update package list
pkg update

# Install essential tools
pkg install -y git python nodejs vim nano

# Install Cursor if available, or use alternatives:
# - Vim/Nano for text editing
# - Git for version control
# - Python/Node.js for development
```

## 🌐 Alternative: Use ngrok for Public Access

If you want to access from anywhere on the internet:

1. **Install ngrok:**
   ```bash
   ./setup-ngrok.sh
   ```

2. **Get a free ngrok account at https://ngrok.com**

3. **Add your authtoken and start the tunnel:**
   ```bash
   ngrok start ssh
   ```

4. **Use the provided public URL to connect from anywhere!**

## 🔒 Security Features
- SSH key-based authentication (no passwords)
- RSA 4096-bit encryption
- Automatic connection monitoring
- Server alive pings every 60 seconds

## 📊 Monitor Connections
```bash
# Check active SSH connections
sudo netstat -tlnp | grep :22

# View SSH logs
sudo journalctl -u ssh -f
```

## 🚨 Troubleshooting
- **Connection refused:** Make sure SSH is running (`sudo systemctl status ssh`)
- **Permission denied:** Check your SSH keys are properly configured
- **Can't connect from outside:** You may need to configure firewall rules

## 🎯 Next Steps
1. Test the connection from your Android device
2. Install your preferred development tools in Termux
3. Start coding remotely!

Your tunnel is ready! 🎉
