# 🚀 Remote Development Tunnel

A complete remote development setup for both desktop (Cursor) and mobile (Android) development.

## ✅ Current Status
- SSH server running on port 22
- Your IP: **100.115.92.205**
- SSH key authentication configured
- VS Code Server available for web-based development
- Ready for both Cursor and Android connections!

## 🖥️ Desktop Development (Cursor)

### Quick Start
1. In Cursor, press `Ctrl+Shift+P` (or `Cmd+Shift+P` on Mac)
2. Type "Remote-SSH: Connect to Host"
3. Enter: `android-tunnel` (recommended) or `soto@localhost`

### Connection Options
- **android-tunnel** (recommended)
- **soto@localhost**
- **soto@100.115.92.205**

## 📱 Mobile Development (Android)

### Option 1: Termux (Recommended)
```bash
# Install Termux from F-Droid
# Then connect:
ssh soto@100.115.92.205

# Install development tools:
pkg update
pkg install -y git python nodejs vim nano
```

### Option 2: VS Code Server (Web Browser)
```bash
# Start VS Code Server:
./start-vscode-server.sh

# Access from Android browser:
http://100.115.92.205:8080
```

### Option 3: SSH Clients
- **JuiceSSH** (Google Play Store)
- **ConnectBot** (F-Droid)
- **Termius** (Google Play Store)

## 🛠️ Available Tools

### Development Tools
- **Git** - Version control
- **Python** - Python development
- **Node.js** - JavaScript/TypeScript development
- **Vim/Nano** - Text editing
- **VS Code Server** - Full IDE in browser

### Connection Tools
- **SSH** - Secure shell access
- **ngrok** - Public internet access
- **Auto-reconnect** - Persistent connections

## 📋 Quick Commands

### Test Your Setup
```bash
# Test SSH connection
./test-connection.sh

# Test Android connectivity
./android-connection-test.sh
```

### Start Services
```bash
# Start VS Code Server
./start-vscode-server.sh

# Start ngrok for public access
./setup-ngrok.sh
```

### Monitor Connections
```bash
# Check active SSH connections
sudo netstat -tlnp | grep :22

# View SSH logs
sudo journalctl -u ssh -f
```

## 🌐 Public Access

### Setup ngrok
1. Get free account at https://ngrok.com
2. Add your authtoken: `ngrok config add-authtoken YOUR_TOKEN`
3. Start tunnel: `ngrok tcp 22` (for SSH) or `ngrok http 8080` (for VS Code Server)

### Access from Anywhere
- **SSH**: Use the ngrok TCP URL
- **VS Code**: Use the ngrok HTTP URL

## 🔒 Security Features
- SSH key-based authentication (no passwords)
- RSA 4096-bit encryption
- Automatic connection monitoring
- Server alive pings every 60 seconds

## 📊 Connection Information
- **IP Address**: 100.115.92.205
- **SSH Port**: 22
- **VS Code Server Port**: 8080
- **Username**: soto
- **SSH Key**: ~/.ssh/id_rsa

## 🚨 Troubleshooting

### Common Issues
- **Connection refused**: Check SSH service (`sudo systemctl status ssh`)
- **Permission denied**: Verify SSH keys are configured
- **Slow connection**: Use compression (`ssh -C soto@100.115.92.205`)

### Performance Tips
- Use compression for slow connections
- Enable SSH multiplexing
- Use lightweight editors on mobile
- Consider VS Code Server for full IDE experience

## 📚 Documentation
- [Cursor SSH Setup](CURSOR_SSH_SETUP.md) - Detailed Cursor configuration
- [Android Setup](ANDROID_SETUP.md) - Comprehensive Android guide
- [Connection Guide](CONNECTION_GUIDE.md) - Original connection guide

## 🎯 Next Steps
1. Test your connection with `./test-connection.sh`
2. Try connecting from your Android device
3. Start VS Code Server for web-based development
4. Set up ngrok for public access
5. Start coding remotely! 🎉

## 📞 Support
If you encounter issues:
1. Check the troubleshooting sections in the guides
2. Verify SSH service is running
3. Test manual SSH connections
4. Check system logs for errors

Happy remote development! 🚀
