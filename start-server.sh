#!/bin/bash
# pm2 sets NODE_CHANNEL_FD / NODE_CHANNEL_SERIALIZATION_MODE on every child for
# its own IPC. yt-dlp spawns `node` for the n-challenge; that child inherits
# the FD, tries to talk IPC on it, and aborts with SIGABRT (returncode -6).
# Unsetting them here gives every child node a clean environment.
unset NODE_CHANNEL_FD NODE_CHANNEL_SERIALIZATION_MODE NODE_APP_INSTANCE

export PATH="/root/.nvm/versions/node/v22.20.0/bin:${PATH}"
export NODE_OPTIONS="--max-old-space-size=4096"
cd /root/NB_Projects/script
exec /root/NB_Projects/script/.venv/bin/uvicorn server.app:app \
  --host 0.0.0.0 --port 3008 \
  --workers 1 \
  --proxy-headers \
  --forwarded-allow-ips=* \
  --timeout-keep-alive 90
