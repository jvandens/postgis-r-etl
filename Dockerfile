FROM rocker/rstudio:4.3

RUN apt-get update && \
    apt-get install -y \
        cron \
        libpq5 \
        libpq-dev \
        libcurl4-openssl-dev \
        libssl-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
