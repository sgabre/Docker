FROM python:3.11-slim-bookworm
 
# arm64, amd64, ...
ARG ARCH
 
# This the fw-dummy docker image. it like the hello word

# Set working directory
WORKDIR /mnt/workspace

#COPY ${JLINK_DOWNLOAD_URL}/${JLINK_INSTALLER} /tmp/${JLINK_INSTALLER} 

# Base image
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install --no-install-recommends -y \
                  git \
                  unzip \
                  wget \
      && apt-get clean \
      && rm -rf /var/lib/apt/lists/* 
     


 # Default command
CMD ["bash"]
 