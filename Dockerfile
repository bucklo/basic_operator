FROM alpine:3.7

COPY operator.sh /operator/
RUN chmod +x /operator/operator.sh

RUN apk --update add git less openssh curl && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*

RUN wget -O /usr/local/bin/kubectl https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl
RUN chmod +x /usr/local/bin/kubectl

CMD /bin/sh /operator/operator.sh