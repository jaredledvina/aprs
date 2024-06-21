FROM debian:stable-slim as base

ENV LANG C.UTF-8
RUN apt update && apt install -y --no-install-recommends \
    libasound2-dev \
    libusb-1.0-0-dev \
    libudev-dev \
    alsa-utils \
  && rm -rf /var/lib/apt/lists/*

FROM base as build

RUN apt update && apt install -y --no-install-recommends \
    git \
    build-essential \
    ca-certificates \
    cmake \
  && rm -rf /var/lib/apt/lists/*

RUN git clone "https://github.com/wb2osz/direwolf.git" /tmp/direwolf \
  && cd /tmp/direwolf \
  && git checkout dev \
  && mkdir build && cd build \
  && cmake .. \
  && make -j4 \
  && make DESTDIR=/target install \
  && make install-conf \
  && find /target/usr/local/bin/ -type f -exec strip -p --strip-debug {} \;

FROM base as runtime

COPY --from=build /target/usr/local/bin /usr/local/bin
COPY --from=build /tmp/direwolf/data/tocalls.yaml /usr/share/direwolf/tocalls.yaml
COPY --from=build /tmp/direwolf/data/symbols-new.txt /usr/share/direwolf/symbols-new.txt

RUN addgroup -gid 996 direwolf && adduser -q -uid 1000 -gid 996 --no-create-home --disabled-login --gecos "" direwolf 
USER direwolf

WORKDIR /
