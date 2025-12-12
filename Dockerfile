FROM lukemathwalker/cargo-chef:latest-rust-1 AS chef
RUN update-ca-certificates
WORKDIR /app

FROM chef AS planner
COPY . .
RUN cargo chef prepare --recipe-path recipe.json

# Separate builder stages for each component

FROM chef AS builder_symfonia
COPY --from=planner /app/recipe.json recipe.json
RUN cargo chef cook --release -p symfonia --recipe-path recipe.json
COPY . .
RUN SQLX_OFFLINE=true cargo build --release -p symfonia

# Create a common runtime base image
FROM debian:latest AS runtime_base
RUN apt-get update -qq -o Acquire::Languages=none && \
    env DEBIAN_FRONTEND=noninteractive apt-get install \
    -yqq \
        ca-certificates \
        libssl-dev \
        pkg-config \
        tzdata \
        curl && \
        rm -rf /var/lib/apt/lists/* && \
        ln -fs /usr/share/zoneinfo/Etc/UTC /etc/localtime

RUN useradd \
    --uid 10001 \
    --home-dir /nonexistent \
    --shell /sbin/nologin \
    --no-create-home \
    --comment "" \
    symfonia

# Symfonia component image
FROM runtime_base AS runtime_symfonia
COPY --from=builder_symfonia --chown=symfonia:symfonia /app/target/release/symfonia /app/symfonia
USER symfonia:symfonia
WORKDIR /app/
ENTRYPOINT ["/app/symfonia"]
