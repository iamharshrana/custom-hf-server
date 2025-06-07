FROM kserve/huggingfaceserver:latest

USER 0

RUN apt-get update && \
    apt-get install -y --no-install-recommends python3-pip && \
    rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir --upgrade pip

RUN pip install --no-cache-dir \
    torch==2.1.2+cu118 \
    torchvision==0.16.1+cu118 \
    --extra-index-url https://download.pytorch.org/whl/cu118

USER 1000

