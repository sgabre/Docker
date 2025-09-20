#!/bin/bash

# Detect OS platform
PLATFORM=$(uname -s)     # e.g., Linux, Darwin

# Detect architecture
ARCH=$(uname -m)         # e.g., x86_64, aarch64

echo "Hello, i'm running on ${PLATFORM}-${ARCH}..."