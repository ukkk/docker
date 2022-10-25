# VERSION 1.0
FROM alpine:3.12

LABEL maintainer="uk.devc@gmail.com"

# Install Fio
RUN apk --no-cache add \
        fio==3.20-r0 \
        libaio  \
        procps  \
        bash \
        openssh && \
    echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config && \
    echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config && \
    echo -n 'root:!QAZ2wsx' | chpasswd && \
    ssh-keygen -A

CMD ["/usr/sbin/sshd","-D"]
