FROM debian:bookworm-slim
 
# Platfrom is linux
# ARCH is amd64, arm64

ARG PLATFORM
ARG ARCH                
ARG ARM_TOOLCHAIN_VERSION="14.2.rel1"
ARG ARM_GNU_TOOLCHAIN_DOWNLOAD_URL="https://developer.arm.com/-/media/Files/downloads/gnu/14.2.rel1/binrel"
ARG ARCH_NAME

# Set working directory
WORKDIR /mnt/workspace

# Base image
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install --no-install-recommends -y \
                  git \
                  unzip \
                  xz-utils \
                  wget \
                  ca-certificates \
      && apt-get clean \
      && rm -rf /var/lib/apt/lists/* 
     

RUN apt-get update && apt-get install --no-install-recommends -y \
      # -- Install CMake--
      cmake \
      # -- Install Ninja--
      ninja-build \
       # -- Clean-Up--
      && apt-get clean \
      && rm -rf /var/lib/apt/lists/* 

      # -- Install ARM Tool Chain --
RUN set -e; \
    if [ "$ARCH" = "amd64" ]; then TOOLCHAIN_ARCH="x86_64"; \
    elif [ "$ARCH" = "arm64" ]; then TOOLCHAIN_ARCH="aarch64"; \
    else echo "Unsupported ARCH $ARCH"; exit 1; fi; \
    export ARM_GNU_TOOLCHAIN_INSTALLER="arm-gnu-toolchain-${ARM_TOOLCHAIN_VERSION}-${TOOLCHAIN_ARCH}-arm-none-eabi.tar.xz"; \
    echo "Downloading: ${ARM_GNU_TOOLCHAIN_DOWNLOAD_URL}/${ARM_GNU_TOOLCHAIN_INSTALLER}"; \
    wget -q ${ARM_GNU_TOOLCHAIN_DOWNLOAD_URL}/${ARM_GNU_TOOLCHAIN_INSTALLER}; \
    mkdir -p /opt/arm-toolchain; \
    tar -xf ${ARM_GNU_TOOLCHAIN_INSTALLER} -C /opt/arm-toolchain --strip-components=1; \
    rm -f ${ARM_GNU_TOOLCHAIN_INSTALLER}

# Add toolchain to PATH
ENV PATH="/opt/arm-toolchain/bin:${PATH}"

 # Default command
CMD ["bash"]
 



# CLI: docker buildx build --platform linux/amd64--build-arg PLATFORM=linux  --build-arg ARCH=amd64  -t ghcr.io/sgabre/fw-arm-build:latest . --push .
# [NUC 8 Pro, MacMini Intel = linux/amd64] 86_64 Linux hosted cross toolchains:           arm-gnu-toolchain-14.3.rel1-x86_64-arm-none-eabi.tar.xz 
# [Raspberry = linux/arm64] aarch64 Linux hosted cross toolchains:         arm-gnu-toolchain-14.2.rel1-aarch64-arm-none-eabi.tar.xz

# macOS (x86_64) hosted cross toolchains:        arm-gnu-toolchain-14.2.rel1-darwin-x86_64-arm-none-eabi.pkg
# macOS (Apple silicon) hosted cross toolchains: arm-gnu-toolchain-14.2.rel1-darwin-arm64-arm-none-eabi.pkg

#ARG ARM_GNU_TOOLCHAIN_DOWNLOAD_URL="https://macmin.local/-/TBD/armtoolchain/${ARM_TOOLCHAIN_VERSION}/"
#So if amd64 then x86_64
# if arm64 then aarch64
# arm-gnu-toolchain-14.3.rel1-x86_64-arm-none-eabi.tar.xz => arm-gnu-toolchain-14.3.rel1-amd64-arm-none-eabi.tar.xz
# arm-gnu-toolchain-14.2.rel1-aarch64-arm-none-eabi.tar.xz => arm-gnu-toolchain-14.2.rel1-arm64-arm-none-eabi.tar.xz 
# arm-gnu-toolchain-14.3.rel1-$ARCHI-arm-none-eabi.tar.xz 

#https://developer.arm.com/-/media/Files/downloads/gnu/14.2.rel1/binrel/arm-gnu-toolchain-14.2.rel1-aarch64-arm-none-eabi.tar.xz