# 📱 Android Quick Reference

## 🚀 Quick Connect
```bash
ssh soto@100.115.92.205
```

## 🌐 Web-Based Development
```bash
# Start VS Code Server
./start-vscode-server.sh

# Access in browser
http://100.115.92.205:8080
```

## 📱 Android Apps

### Termux (Recommended)
- **Download**: F-Droid or Google Play Store
- **Connect**: `ssh soto@100.115.92.205`
- **Install tools**: `pkg install git python nodejs vim`

### SSH Clients
- **JuiceSSH** (Google Play Store)
- **ConnectBot** (F-Droid)
- **Termius** (Google Play Store)

## 🛠️ Essential Commands

### Development Tools
```bash
# Install basic tools
pkg update
pkg install -y git python nodejs vim nano

# Python development
pip install ipython jupyter

# Node.js development
npm install -g live-server

# Git setup
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

### Connection Options
```bash
# Basic SSH
ssh soto@100.115.92.205

# With compression (faster)
ssh -C soto@100.115.92.205

# Auto-reconnect
while true; do ssh soto@100.115.92.205; sleep 5; done
```

## 🌐 Public Access

### ngrok Setup
```bash
# Install ngrok
./setup-ngrok.sh

# Start SSH tunnel
ngrok tcp 22

# Start VS Code tunnel
ngrok http 8080
```

## 📊 Connection Info
- **IP**: 100.115.92.205
- **User**: soto
- **Port**: 22 (SSH), 8080 (VS Code)
- **No password needed** (SSH key auth)

## 🚨 Troubleshooting
- **Connection refused**: Check if server is running
- **Slow connection**: Use `ssh -C` for compression
- **Disconnections**: Use auto-reconnect script

## 🎯 Pro Tips
- Use Termux for command-line development
- Use VS Code Server for full IDE experience
- Use ngrok for access from anywhere
- Enable compression for better performance

Happy coding on Android! 🚀
