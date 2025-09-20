FROM debian:bookworm-slim

# Optional: multi-arch argument
ARG ARCH
ARG PLATFORM
# Set working directory
WORKDIR /mnt/workspace

# Install bash (Debian-based)
RUN apt-get update && \
    apt-get install -y bash && \
    rm -rf /var/lib/apt/lists/*

# Copy your script
COPY RunMe.sh .
RUN chmod +x RunMe.sh

# Default command
ENTRYPOINT ["./RunMe.sh"]

 