FROM alpine:3.20

ARG ACCOUNT_PASSWORD="Azerty#2024"

RUN apk --update add --no-cache \
        bash \
        build-base \
        gdb \
        cmake \
        openssh-server \
        boost-dev \
        gtest-dev \
        rsync

ADD ./rootfs /

RUN printf "${ACCOUNT_PASSWORD}\n${ACCOUNT_PASSWORD}\n" | passwd

EXPOSE 2222
CMD ["/usr/bin/entrypoint.sh"]

# You must ensure to persist /tmp & /etc/ssh/ folder from this container somewhere.
# This way you should be able to avoid warning and rebuild everytime you restart the container.
