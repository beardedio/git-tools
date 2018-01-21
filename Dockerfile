FROM alpine

RUN apk --no-cache upgrade && \
    apk add --no-cache \
        bash \
        bash-doc \
        bash-completion \
        git \
        openssh-client

COPY _build /_build/
COPY _run /_run/

# Move files in to container
RUN cp /_build/run-cmd.sh /usr/bin/run && \
    cp -r /_build/bin/* /usr/bin/ && \
    /_build/01-setup_ssh_client.sh && \
    mkdir /repos

# Clean up tmp and _build files
RUN rm -rf /tmp/* && \
    rm -rf /_build

WORKDIR /repos
ENTRYPOINT ["run"]
