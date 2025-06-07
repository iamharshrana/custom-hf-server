FROM kserve/huggingfaceserver:latest

# Switch to root to install packages
USER 0

# Install pip and dependencies (just in case)
RUN apt-get update && \
    apt-get install -y --no-install-recommends python3-pip && \
    rm -rf /var/lib/apt/lists/*

# Upgrade pip
RUN pip install --no-cache-dir --upgrade pip

# Install exact PyTorch build with CUDA 11.8 support
RUN pip install --no-cache-dir \
    torch==2.0.0+cu118 \
    torchvision==0.15.1+cu118 \
    --extra-index-url https://download.pytorch.org/whl/cu118

# Revert to non-root user
USER 1000
