# edge-web

Minimal container: nginx on `$PORT` (default 3000) answers `/` with 200 for health checks and forwards one WebSocket path to a local service.

Required env: `APP_ID`. Optional env: `APP_PATH` (default `/ws`).
No credentials are stored in this repository.
