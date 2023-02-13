# create an argument called, "BASE_CONTAINER" and point to jupyter minimal notebook image
ARG BASE_CONTAINER=jupyter/minimal-notebook:ubuntu-22.04

FROM $BASE_CONTAINER

LABEL author="Patrick Delaney"

# switch to user root briefly
USER root

# Update default packages
RUN apt-get update && apt-get install -y \
    build-essential \
    curl

RUN sh -c "$(curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh)" -y -f

# Install TensorFlow and system dependencies
RUN apt-get update && apt-get install -y \
        build-essential \
        curl \
        libhdf5-dev \
        libblas-dev \
        libc-ares-dev \
        libcairo2-dev \
        libeigen3-dev \
        libatlas-base-dev \
        libopenblas-dev \
        libpango1.0-dev \
        liblapack-dev \
        libssl-dev \
        gfortran \
        python3-dev \
        python3-pip \
        pip \
        binutils \
        gcc \
        libc-dev \
        libc6 \
        # libgcc-s1 \
        libstd-rust-dev \
        cargo \
        rustc \
        wget \
        unzip

# !conda install pillow

# Upgrade Pip
RUN pip install --upgrade pip

# Install packages from requirements.txt
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copy code from development container
COPY ./work /home/jovyan/work/

# Switch back to jovyan to avoid accidental container runs as root
# USER $NB_UID

# Comment out USER $NB_UID to allow run as root