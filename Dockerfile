FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    grub-common \
    whiptail \
    git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . /app

# Install SDK
RUN pip3 install .

# Default command: Run validation
CMD ["princetheme", "check"]

