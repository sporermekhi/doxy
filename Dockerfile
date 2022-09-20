FROM alpine:edge

ARG AUUID="9affe77c-2a9d-4f7d-a27a-d76cf5b05261"
ARG CADDYIndexPage="https://www.free-css.com/assets/files/free-css-templates/download/page273/savory.zip"
ARG ParameterSSENCYPT="chacha20-ietf-poly1305"
ARG PORT=8080

ADD etc/Caddyfile /tmp/Caddyfile
ADD etc/xray.json /tmp/xray.json
ADD deploy.sh /deploy.sh
ADD start.sh /start.sh

RUN apk update && \
    apk add --no-cache ca-certificates caddy tor wget && \
    bash deploy.sh
    
RUN chmod +x /start.sh

CMD /start.sh
