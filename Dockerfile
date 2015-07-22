# Derive from a container image that allows us to run multiple programs
FROM phusion/baseimage:0.9.16

# Copy in the remaining rootfs (do this last, since it may include overrides)
COPY dnsdock /usr/local/bin/

# Clean up
RUN rm -rf /var/cache/apt/archives/*

# How to run this container
ENTRYPOINT ["/usr/local/bin/dnsdock"]
