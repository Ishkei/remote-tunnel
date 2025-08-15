# 🚀 Cursor Remote SSH Setup Guide

## ✅ Problem Solved!
Your SSH server is now configured for **key-based authentication only** - no more password prompts!

## 🔧 What We Fixed
1. **Disabled password authentication** - SSH now only accepts key-based auth
2. **Fixed SSH configuration** - Created proper SSH config that Cursor can read
3. **Set correct permissions** - SSH keys have proper security permissions
4. **Tested connection** - All authentication methods working

## 📱 How to Connect with Cursor

### Option 1: Connect to android-tunnel (Recommended)
1. In Cursor, press `Ctrl+Shift+P` (or `Cmd+Shift+P` on Mac)
2. Type "Remote-SSH: Connect to Host"
3. Select "Connect to Host"
4. Enter: `android-tunnel`

### Option 2: Connect to localhost
1. In Cursor, press `Ctrl+Shift+P`
2. Type "Remote-SSH: Connect to Host"
3. Enter: `soto@localhost`

### Option 3: Connect via IP Address
1. In Cursor, press `Ctrl+Shift+P`
2. Type "Remote-SSH: Connect to Host"
3. Enter: `soto@100.115.92.205`

## 🔑 SSH Configuration Details
Your SSH config (`~/.ssh/config`) now contains:
```
Host android-tunnel
    HostName localhost
    User soto
    IdentityFile /home/soto/.ssh/id_rsa
    StrictHostKeyChecking no

Host localhost
    User soto
    IdentityFile /home/soto/.ssh/id_rsa
    StrictHostKeyChecking no
```

## 🚨 Troubleshooting

### If Cursor still asks for password:
1. Make sure you're using `android-tunnel` as the host name
2. Try connecting to `soto@localhost` instead
3. Check that Cursor is using the SSH key (should be automatic now)

### If connection fails:
1. Run `./test-connection.sh` to verify SSH is working
2. Check SSH service: `sudo systemctl status ssh`
3. Verify SSH keys: `ls -la ~/.ssh/`

### To test SSH manually:
```bash
ssh android-tunnel "echo 'test connection'"
ssh soto@localhost "echo 'test connection'"
```

### To revert password authentication (if needed):
```bash
sudo cp /etc/ssh/sshd_config.backup /etc/ssh/sshd_config
sudo systemctl restart ssh
```

## 🎯 Next Steps
1. Try connecting with Cursor using `android-tunnel` as the host
2. Once connected, you can open your project folder
3. Start coding remotely! 🎉

## 📞 Support
If you still have issues:
1. Check the SSH logs: `sudo journalctl -u ssh -f`
2. Test manual SSH: `ssh android-tunnel`
3. Verify your SSH key works: `ssh -i ~/.ssh/id_rsa soto@localhost`
