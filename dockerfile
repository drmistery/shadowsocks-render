FROM debian:stable-slim

RUN apt-get update && apt-get install -y shadowsocks-libev && rm -rf /var/lib/apt/lists/*

# Создаем непривилегированного пользователя
RUN useradd -m appuser

ENV SERVER_ADDR=0.0.0.0
ENV SERVER_PORT=8388
ENV PASSWORD=yourpassword
ENV METHOD=aes-256-gcm

EXPOSE 8388

# Переключаемся на непривилегированного пользователя
USER appuser

# Запускаем Shadowsocks
CMD ["ss-server", "-s", "0.0.0.0", "-p", "${SERVER_PORT}", "-k", "${PASSWORD}", "-m", "${METHOD}"]
