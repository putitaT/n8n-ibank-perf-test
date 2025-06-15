FROM n8nio/n8n

USER root

RUN apk update && apk add --no-cache \
    make \
    curl \
    python3 \
    py3-pip \
    bash \
    libc6-compat

RUN curl -LO "https://dl.k8s.io/release/$(curl -sL https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl && \
    rm kubectl

RUN ln -sf python3 /usr/bin/python

USER node
