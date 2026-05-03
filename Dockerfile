# 🛰️ AETHER-1 Build Environment
# Use a Qt-ready base image for building the application
FROM ubuntu:22.04

LABEL org.opencontainers.image.source=https://github.com/abhiramvsmg/AETHER-1-Digital-Twin-CubeSat-Telemetry
LABEL org.opencontainers.image.description="Mission-critical build environment for AETHER-1 CubeSat Framework"

ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    qt6-base-dev \
    qt6-charts-dev \
    qt6-3d-dev \
    qt6-serialport-dev \
    libgl1-mesa-dev \
    && rm -rf /var/lib/apt/lists/*

# Set workspace
WORKDIR /app
COPY . .

# Build the application
RUN mkdir build && cd build && \
    cmake .. -DCMAKE_BUILD_TYPE=Release && \
    cmake --build . --parallel $(nproc)

CMD ["./build/AETHER-1"]
