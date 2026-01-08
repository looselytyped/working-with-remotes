FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends build-essential ca-certificates \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy source and build
COPY src/main.cpp ./
RUN g++ -O2 -std=c++20 main.cpp -o hello

# Run the binary
CMD ["./hello"]