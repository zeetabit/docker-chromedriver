FROM alpine:3.15

RUN addgroup webdriver && adduser -h /home/webdriver -s /bin/sh -G webdriver -D webdriver

WORKDIR /home/webdriver

RUN echo "https://dl-cdn.alpinelinux.org/alpine/v3.15/main" >> /etc/apk/repositories
RUN echo "https://dl-cdn.alpinelinux.org/alpine/v3.15/community" >> /etc/apk/repositories

RUN apk update && apk add chromium-chromedriver chromium

RUN ln -s /usr/lib/chromium/chromium-launcher.sh /usr/local/bin/chrome

USER webdriver

ENTRYPOINT ["chromedriver"]

CMD ["--port=4444", "--whitelisted-ips=", "--allowed-origins=*"]

EXPOSE 4444
