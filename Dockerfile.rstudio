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
        libudunits2-dev \
        libgdal-dev \
        libgeos-dev \
        libproj-dev \
        gdal-bin \
        make \
        build-essential \
        python3 \
        python3-pip \
        python3-venv \
        && apt-get clean \
        && rm -rf /var/lib/apt/lists/*

# Set R library path (makes install-packages default here)
ENV R_LIBS_SITE=/usr/local/lib/R/site-library

# Install default R packages (tidyverse, RPostgres, sf)
RUN R -e "install.packages(c('tidyverse','RPostgres','sf'), repos='https://cloud.r-project.org/', dependencies=TRUE)"

# Install py packages
RUN pip3 install --no-cache-dir pandas sqlalchemy psycopg2-binary

# Entrypoint will still be overridden by compose to handle cron + RStudio

