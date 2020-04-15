FROM debian:jessie

RUN apt-get update && \
    apt-get install -y git less make g++ && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* 

WORKDIR /src

ARG PHYSICELL_VERSION=1.6.1

RUN git clone --branch $PHYSICELL_VERSION --depth 1 https://github.com/MathCancer/PhysiCell.git && \
    cd /src/PhysiCell && \
    make clean && \
    make reset >/dev/null 2>&1 || true

VOLUME ["/src/PhysiCell"]

CMD ["/bin/bash"]
