FROM ubuntu:14.04

ENV ADDRESS=value

RUN apt-get update && apt-get install -y git cmake build-essential libboost-all-dev

RUN \
    git clone -b Linux https://github.com/nicehash/nheqminer.git && \
    cd nheqminer/cpu_xenoncat/Linux/asm/ && \
    sh assemble.sh && \
    cd ../../../Linux_cmake/nheqminer_cpu && \
    cmake . && \
    make -j $(nproc)

ADD run.sh /

CMD ./run.sh