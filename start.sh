#!/usr/bin/env bash
# 天气日记 · 本地服务器启动脚本
# 用途：手机要"安装到主屏幕 / 添加到主屏幕"，必须通过 http(s) 访问（不能直接双击 file:// 打开）。
# 用法：bash start.sh  →  然后用浏览器打开提示的地址。
set -e
cd "$(dirname "$0")"
PORT="${1:-8080}"

echo "✅ 本机浏览器访问：  http://localhost:$PORT/weather-diary.html"
IP=$(hostname -I 2>/dev/null | awk '{print $1}')
if [ -n "$IP" ]; then
  echo "📱 手机访问（与电脑同一 WiFi）：  http://$IP:$PORT/weather-diary.html"
else
  echo "📱 手机访问：请查看本机在局域网中的 IP，访问 http://<本机IP>:$PORT/weather-diary.html"
fi
echo ""
echo "手机浏览器打开后 → 点右上角「⋯」菜单 → 「添加到主屏幕 / 安装应用」即可。"
echo "按 Ctrl+C 停止服务器。"
echo "---------------------------------------------------------------"

python3 -m http.server "$PORT"
