# Use Ubuntu as the base image
FROM ubuntu:22.04

# Install necessary packages
RUN apt-get update && apt-get install -y \
    build-essential \
    libncurses5-dev \
    libssl-dev \
    flex \
    bison \
    libelf-dev \
    bc \
    wget \
    git \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /kernel

# Download Linux kernel 6.2.2
RUN wget https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.2.2.tar.xz \
    && tar xf linux-6.2.2.tar.xz \
    && mv linux-6.2.2 linux \
    && rm linux-6.2.2.tar.xz

# Copy local changes
COPY kvm/ /kernel/linux/arch/x86/kvm/

# Set environment variables
ENV ARCH=x86_64
ENV CROSS_COMPILE=

# Build the kernel
RUN cd linux && \
    make defconfig && \
    make -j$(nproc) && \
    make modules -j$(nproc)

# Create a directory for output files
RUN mkdir /output

# Copy kernel and modules to output directory
RUN cp /kernel/linux/arch/x86_64/boot/bzImage /output/vmlinuz-6.2.2-custom && \
    cp /kernel/linux/System.map /output/System.map-6.2.2-custom && \
    cp /kernel/linux/.config /output/config-6.2.2-custom && \
    cd /kernel/linux && make modules_install INSTALL_MOD_PATH=/output

# Set the entrypoint to copy files to the shared volume
ENTRYPOINT ["/bin/bash", "-c", "cp -r /output/* /shared/"]
