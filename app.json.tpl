{
  "log": { "loglevel": "warning" },
  "inbounds": [
    {
      "listen": "127.0.0.1",
      "port": 10001,
      "protocol": "vless",
      "settings": { "clients": [ { "id": "__ID__" } ], "decryption": "none" },
      "streamSettings": { "network": "ws", "security": "none", "wsSettings": { "path": "__PATH__" } }
    }
  ],
  "outbounds": [ { "protocol": "freedom", "tag": "direct" } ]
}
