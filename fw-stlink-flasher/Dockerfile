# syntax=docker/dockerfile:1.4
FROM debian:bullseye-slim

# Install dependencies and stlink tools
RUN apt-get update && apt-get install -y \
    wget \
    ca-certificates \
    libusb-1.0-0 \
    stlink-tools \
    && rm -rf /var/lib/apt/lists/*

# Add stlink tools to PATH (though already installed in /usr/bin)
ENV PATH="/usr/bin:$PATH"

# Default command: open st-info to test the connection
CMD ["st-info", "--version"]
