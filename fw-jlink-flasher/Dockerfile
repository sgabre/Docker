# syntax=docker/dockerfile:1.4
FROM debian:bullseye-slim

# Install dependencies
RUN apt-get update && apt-get install -y \
    wget \
    ca-certificates \
    libusb-1.0-0 \
    && rm -rf /var/lib/apt/lists/*

# Define build arguments for architecture
ARG TARGETARCH

# Download J-Link software (choose correct arch)
# Note: You must accept SEGGER’s license when downloading.
RUN case "$TARGETARCH" in \
        "amd64")  wget -O /tmp/jlink.deb https://www.segger.com/downloads/jlink/JLink_Linux_x86_64.deb ;; \
        "arm64")  wget -O /tmp/jlink.deb https://www.segger.com/downloads/jlink/JLink_Linux_arm64.deb ;; \
        *) echo "Unsupported arch: $TARGETARCH" && exit 1 ;; \
    esac && \
    dpkg -i /tmp/jlink.deb || apt-get -f install -y && \
    rm /tmp/jlink.deb

# Add J-Link tools to PATH
ENV PATH="/opt/SEGGER/JLink:$PATH"

# Default command: open J-Link Commander
CMD ["JLinkExe"]
