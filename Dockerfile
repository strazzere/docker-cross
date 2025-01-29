FROM docker:27.5.0-dind-alpine3.21

LABEL maintainer="Tim Strazzere"

# Dependencies
RUN apk update \
 && apk upgrade \
 && apk add curl alpine-sdk \
 && curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

RUN PATH="$HOME/.cargo/bin:$PATH" cargo install cross --force --git https://github.com/cross-rs/cross

ENV PATH=/root/.cargo/bin:${PATH}