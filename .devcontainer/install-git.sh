#!/bin/bash
set -e

# Update package list and install Git
apt-get update -qq && \
apt-get install -y --no-install-recommends git && \
rm -rf /var/lib/apt/lists/*