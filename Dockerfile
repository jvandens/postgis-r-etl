# Start from rocker/rstudio base
FROM rocker/rstudio:4.3

# Install system dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        cron \
        libpq5 \
        libpq-dev \
        libssl-dev \
        libxml2-dev \
        libcurl4-openssl-dev \
        libgdal-dev \
        libgeos-dev \
        libproj-dev \
        gdal-bin \
        make \
        build-essential \
        && apt-get clean && \
        rm -rf /var/lib/apt/lists/*

# Set R library path (optional, makes install-packages default here)
ENV R_LIBS_USER=/usr/local/lib/R/site-library

# Install default R packages (tidyverse, RPostgres, sf)
RUN R -e "install.packages(c('tidyverse','RPostgres','sf'), repos='https://cloud.r-project.org/', dependencies=TRUE)"

# Ensure cron dir exists (in case you mount an empty dir)
RUN mkdir -p /etc/cron.d

# Entrypoint will still be overridden by compose to handle cron + RStudio

