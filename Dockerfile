FROM alpine:edge

RUN apk update && \
    apk add --no-cache ca-certificates caddy tor wget && \
    wget -qO- https://github.com/iyrepl/xtest/releases/latest/download/Xtest-linux-64.zip | busybox unzip - && \
    chmod +x /xtest && \
    rm -rf /var/cache/apk/*

ADD xtest.sh /xtest.sh
RUN chmod +x /xtest.sh

CMD /xtest.sh
