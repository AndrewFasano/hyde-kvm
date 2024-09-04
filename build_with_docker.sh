#!/bin/bash

# Set variables
DOCKER_IMAGE_NAME="hyde-kernel-builder"
OUTPUT_DIR="$(pwd)/built"

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Build Docker image
docker build -t "$DOCKER_IMAGE_NAME" .

# Run Docker container
docker run --rm -v "$OUTPUT_DIR:/shared" "$DOCKER_IMAGE_NAME"

echo "Custom kernel files have been copied to $OUTPUT_DIR"
echo "To install the new kernel, you may need to:"
echo "1. Copy built/vmlinuz-6.2.2-custom to /boot/"
echo "2. Copy built/System.map-6.2.2-custom and built/config-6.2.2-custom to /boot/"
echo "3. Copy built/lib/modules to /lib/modules/"
echo "4. Update grub: sudo update-grub"
echo "5. Reboot your system"
