FROM alpine:3.20
ARG XRAY_VERSION=v26.11.9
ARG XRAY_SHA256=b651f7e1d9966ee2c1b1ee1bf8b52c72771824d3065dce96bbc8bcc19ed95f82
RUN apk add --no-cache ca-certificates tzdata nginx curl unzip \
 && curl -fsSL -o /tmp/x.zip "https://github.com/XTLS/Xray-core/releases/download/${XRAY_VERSION}/Xray-linux-64.zip" \
 && echo "${XRAY_SHA256}  /tmp/x.zip" | sha256sum -c - \
 && unzip -o /tmp/x.zip xray -d /usr/local/bin && chmod +x /usr/local/bin/xray \
 && rm -f /tmp/x.zip && apk del curl unzip
COPY app.json.tpl /etc/app/app.json.tpl
COPY site.conf.tpl /etc/app/site.conf.tpl
COPY start.sh /start.sh
RUN chmod +x /start.sh
EXPOSE 3000
CMD ["/start.sh"]
