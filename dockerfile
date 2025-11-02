# Используем официальный минимальный образ Debian
FROM debian:stable-slim

# Устанавливаем Shadowsocks-libev
RUN apt-get update && apt-get install -y shadowsocks-libev && rm -rf /var/lib/apt/lists/*

# Настройки по умолчанию (Render может их переопределить через переменные)
ENV SERVER_ADDR=0.0.0.0
ENV SERVER_PORT=8388
ENV PASSWORD=yourpassword
ENV METHOD=aes-256-gcm

# Порт, который откроет Render
EXPOSE 8388

# Запуск Shadowsocks сервера
CMD ["ss-server", "-s", "0.0.0.0", "-p", "8388", "-k", "yourpassword", "-m", "aes-256-gcm"]
