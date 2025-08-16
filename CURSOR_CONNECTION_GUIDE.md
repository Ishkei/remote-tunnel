# 🖥️ Cursor Remote SSH Connection Guide

## ✅ **SSH Tunnel Status**
- **Host**: `2.tcp.ngrok.io`
- **Port**: `19573`
- **Username**: `soto`
- **Status**: Active and working

## 🔑 **How to Connect in Cursor**

### **Method 1: Use Host Alias (Recommended)**
1. In Cursor, press `Ctrl+Shift+P` (or `Cmd+Shift+P` on Mac)
2. Type "Remote-SSH: Connect to Host"
3. Select "Connect to Host"
4. Enter: `ngrok-ssh`

### **Method 2: Use Full Connection String**
1. In Cursor, press `Ctrl+Shift+P` (or `Cmd+Shift+P` on Mac)
2. Type "Remote-SSH: Connect to Host"
3. Select "Connect to Host"
4. Enter: `soto@2.tcp.ngrok.io:19573`

## 🚀 **What You'll Get**

- ✅ **Full Cursor experience** from anywhere
- ✅ **SSH connection** through secure ngrok tunnel
- ✅ **No network restrictions**
- ✅ **Access from any device** with Cursor installed

## 📱 **Test Your Connection**

### **Manual SSH Test**
```bash
ssh soto@2.tcp.ngrok.io -p 19573
```

### **Test with Host Alias**
```bash
ssh ngrok-ssh
```

## 🔧 **Troubleshooting**

### **If Connection Fails:**
1. **Check tunnel status**: Make sure ngrok is running
2. **Verify port**: Use port `19573` (not 22)
3. **Check SSH config**: Verify `~/.ssh/config` is correct

### **Common Issues:**
- **"Could not resolve hostname"**: Use the correct hostname `2.tcp.ngrok.io`
- **"Connection refused"**: Check if ngrok tunnel is active
- **"Permission denied"**: Verify SSH keys are configured

## 🎯 **Quick Connection Steps**

1. **In Cursor**: `Ctrl+Shift+P` → "Remote-SSH: Connect to Host"
2. **Enter**: `ngrok-ssh` (or `soto@2.tcp.ngrok.io:19573`)
3. **Press Enter** and wait for connection
4. **Start coding** from anywhere in the world!

## 🌍 **Access from Anywhere**

- **From work**: Connect using the same method
- **From coffee shop**: Same connection, no VPN needed
- **From mobile**: If you have Cursor mobile
- **From any computer**: Install Cursor and connect

## 🎉 **You're Ready!**

Your Cursor Remote SSH tunnel is working perfectly. Use `ngrok-ssh` as the host name in Cursor for the easiest connection!

**Happy coding from anywhere!** 🚀
