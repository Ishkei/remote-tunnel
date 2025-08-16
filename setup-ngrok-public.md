# 🌐 Public Tunnel Setup with ngrok

## ✅ ngrok is Installed!

ngrok is now installed on your system and ready to create public tunnels.

## 🔑 Step 1: Get Your ngrok Authtoken

1. **Go to https://ngrok.com**
2. **Sign up for a free account** (or sign in if you have one)
3. **Get your authtoken** from the dashboard
4. **Copy the authtoken** (it looks like: `2abc123def456ghi789jkl`)

## 🔐 Step 2: Authenticate ngrok

Replace `YOUR_AUTHTOKEN` with your actual token:

```bash
ngrok config add-authtoken YOUR_AUTHTOKEN
```

**Example:**
```bash
ngrok config add-authtoken 2abc123def456ghi789jkl
```

## 🚀 Step 3: Create Public Tunnel

### For VS Code Server (Recommended)
```bash
ngrok http 8080
```

### For SSH Access
```bash
ngrok tcp 22
```

## 📱 Step 4: Access from Anywhere

### VS Code Server Access
1. **Start VS Code Server** (if not already running):
   ```bash
   ./start-vscode-server.sh
   ```

2. **Start ngrok tunnel**:
   ```bash
   ngrok http 8080
   ```

3. **Use the HTTPS URL** from ngrok in your Android browser

### SSH Access
1. **Start SSH tunnel**:
   ```bash
   ngrok tcp 22
   ```

2. **Use the TCP URL** from ngrok for SSH connections

## 🎯 What You'll See

When you run `ngrok http 8080`, you'll see output like:

```
Session Status                online
Account                       your-email@example.com
Version                       3.26.0
Region                       United States (us)
Latency                       51ms
Web Interface                 http://127.0.0.1:4040
Forwarding                    https://abc123.ngrok.io -> http://localhost:8080
```

**Use the `https://abc123.ngrok.io` URL** to access from anywhere!

## 📱 Android Access from Anywhere

### VS Code Server
- **Open your Android browser**
- **Go to the ngrok HTTPS URL** (e.g., `https://abc123.ngrok.io`)
- **Start coding** from anywhere in the world!

### SSH Access
- **Use any SSH client** (Termux, JuiceSSH, etc.)
- **Connect to the ngrok TCP URL** instead of your local IP

## 🔒 Security Notes

- **ngrok URLs are public** - anyone with the URL can access
- **Free accounts have limitations**:
  - Random URLs each time you restart
  - Limited bandwidth
  - Connection limits
- **Consider upgrading** for production use

## 🚨 Troubleshooting

### If ngrok doesn't work:
1. **Check your authtoken** - make sure it's correct
2. **Verify VS Code Server is running** on port 8080
3. **Check ngrok status**: `ngrok status`
4. **Restart ngrok** if needed

### If you can't connect:
1. **Check the ngrok URL** - it changes each time you restart
2. **Verify the tunnel is active** in ngrok dashboard
3. **Check your firewall** settings

## 🎉 Ready for Global Access!

Once you add your authtoken and start the tunnel, you'll have:
- **VS Code Server** accessible from anywhere
- **SSH access** from anywhere
- **No more local network restrictions**

**Next step**: Get your authtoken from ngrok.com and run the authentication command!
