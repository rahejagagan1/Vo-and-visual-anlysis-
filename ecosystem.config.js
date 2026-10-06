module.exports = {
  apps: [{
    name: 'vo-visual-extractor',
    script: '.venv/bin/uvicorn',
    args: 'server.app:app --host 0.0.0.0 --port 3008 --workers 1 --proxy-headers --forwarded-allow-ips=* --timeout-keep-alive 90',
    cwd: '/root/NB_Projects/script',
    interpreter: 'none',
    autorestart: true,
    min_uptime: '30s',
    restart_delay: 5000,
    max_restarts: 5,
  }]
};
