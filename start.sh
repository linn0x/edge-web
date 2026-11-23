#!/bin/sh
# Secrets come only from platform env vars: APP_ID (required), APP_PATH (optional, default /ws).
set -e
[ -n "$APP_ID" ] || { echo "APP_ID env var is required" >&2; exit 1; }
PORT="${PORT:-${SERVER_PORT:-3000}}"
APP_PATH="${APP_PATH:-/ws}"
sed -e "s|__ID__|${APP_ID}|g" -e "s|__PATH__|${APP_PATH}|g" /etc/app/app.json.tpl > /tmp/app.json
chmod 600 /tmp/app.json
sed -e "s|__PORT__|${PORT}|g" -e "s|__PATH__|${APP_PATH}|g" /etc/app/site.conf.tpl > /etc/nginx/http.d/default.conf
/usr/local/bin/xray run -c /tmp/app.json &
exec nginx -g "daemon off;"
