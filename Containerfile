FROM alpine:latest
RUN apk update
RUN apk add gtk+3.0-dev
RUN apk add htop
