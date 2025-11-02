FROM ubuntu:22.04

RUN apt update && apt install -y shadowsocks-libev && \
    apt clean && rm -rf /var/lib/apt/lists/*

ENV SERVER_ADDR=0.0.0.0
ENV SERVER_PORT=8388
ENV PASSWORD
ENV METHOD=aes-256-gcm
ENV TIMEOUT=300

EXPOSE 8388

CMD ss-server -s $SERVER_ADDR -p $SERVER_PORT -k $PASSWORD -m $METHOD --fast-open
