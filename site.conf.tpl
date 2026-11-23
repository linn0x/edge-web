server {
    listen __PORT__;
    server_name _;
    access_log off;
    location = __PATH__ {
        proxy_pass http://127.0.0.1:10001;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
        proxy_set_header Host $host;
        proxy_read_timeout 3600s;
        proxy_send_timeout 3600s;
    }
    location / {
        default_type text/plain;
        return 200 "ok\n";
    }
}
