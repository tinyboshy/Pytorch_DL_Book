FROM pytorch/pytorch

RUN apt update && \
    apt upgrade -y && \
    apt install -y sudo \
                wget \
                curl \
                git \
                build-essential \
                cmake \
                libsm6 \
                libxrender1 \
                libxext-dev \
                x11-apps \
                libgl1-mesa-dev \
                libgtk2.0-dev \
                tree \
                unzip \
                graphviz

RUN python -m pip install --upgrade pip && \
    pip install numpy \
                pandas \
                matplotlib \
                japanize-matplotlib \
                jupyterlab \
                torchviz \
                ipywidgets \
                widgetsnbextension \
                scikit-learn \
                scikit-image \
                torchinfo
                
ARG DOCKER_UID=1000
ARG DOCKER_USER=docker
ARG DOCKER_PASSWORD=docker
RUN useradd -m \
    --uid ${DOCKER_UID} --groups sudo --shell /bin/bash ${DOCKER_USER} \
    && echo ${DOCKER_USER}:${DOCKER_PASSWORD} | chpasswd

WORKDIR /home/${DOCKER_USER}/work

RUN chown -R ${DOCKER_USER} ./

USER ${DOCKER_USER}