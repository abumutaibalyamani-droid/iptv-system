#!/bin/bash
echo "جاري تشغيل نظام IPTV..."
cd proxy && cp -n .env.example .env 2>/dev/null && npm install && pm2 start server.js --name proxy && cd ..
cd stationarr && cp -n .env.example .env 2>/dev/null && cd frontend && npm install && npm run build && cd .. && cd backend && npm install --omit=dev && cd .. && mkdir -p data && pm2 start ecosystem.config.js && cd ..
pm2 save
echo "تم!"
