FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=America/New_York

RUN apt-get -y update && \
    apt-get -y install build-essential cmake git \
        libboost-all-dev libtbb-dev \
        libeigen3-dev libgtest-dev

ARG GTSAM_COMMIT=caa14bc
RUN git clone https://github.com/borglab/gtsam.git && \
    cd gtsam && git checkout ${GTSAM_COMMIT} && \
    mkdir build && cd build && cmake \
        -DCMAKE_BUILD_TYPE=Release \
        -DGTSAM_WITH_EIGEN_MKL=OFF \
        -DGTSAM_BUILD_EXAMPLES_ALWAYS=OFF \
        -DGTSAM_BUILD_TIMING_ALWAYS=OFF \
        -DGTSAM_BUILD_TESTS=OFF \
        .. && \
    make -j8 install && ldconfig

# libgtest needed for DCSAM
# RUN apt-get -y update && apt-get -y install libprotobuf-dev protobuf-compiler libgtest-dev

# RUN cd /usr/src/gtest && mkdir build && cd build && cmake .. -DBUILD_SHARED_LIBS=ON && make && ls lib && cp /usr/src/gtest/build/lib/* /usr/include/

# Eigen3.3 needed for DCSAM
# RUN apt-get -y update && apt-get -y install libeigen3-dev
