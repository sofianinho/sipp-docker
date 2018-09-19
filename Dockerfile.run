FROM ubuntu:18.04

LABEL "author"="github.com/sofianinho"
LABEL "system"="ubuntu 18.04"
LABEL "version"="SIPp v3.5.2"
LABEL "description"="SIPP with sctp, pcap and openssl support"

ARG SIPP_VERSION=3.5.2

COPY . /app

WORKDIR /app

RUN apt-get update && apt-get upgrade -y \
  && apt-get install -y --no-install-recommends\
    curl \
    ca-certificates \
    dh-autoreconf \
    ncurses-dev \
    pkg-config \
    build-essential \
    libssl-dev \
    libpcap-dev \
    libncurses5-dev \
    libsctp-dev \
    lksctp-tools

RUN ./get_release.sh -v "v${SIPP_VERSION}" \
  && mv sipp-${SIPP_VERSION} sipp \
  && cd sipp \
  && ./build.sh --with-sctp --with-pcap --with-openssl 


FROM ubuntu:18.04

LABEL "author"="github.com/sofianinho"
LABEL "system"="ubuntu 18.04"
LABEL "version"="SIPp v3.5.2"
LABEL "description"="SIPP with sctp, pcap and openssl support"

RUN mkdir -p /app/lib

COPY --from=0 /app/sipp/sipp /app/
COPY --from=0 /usr/lib/x86_64-linux-gnu/libpcap.so.0.8 /app/lib
COPY --from=0 /usr/lib/x86_64-linux-gnu/libcrypto.so.1.1 /app/lib
COPY --from=0 /usr/lib/x86_64-linux-gnu/libssl.so.1.1 /app/lib
COPY --from=0 /lib/x86_64-linux-gnu/libpthread.so.0 /app/lib
COPY --from=0 /lib/x86_64-linux-gnu/libncurses.so.5 /app/lib
COPY --from=0 /lib/x86_64-linux-gnu/libtinfo.so.5 /app/lib
COPY --from=0 /usr/lib/x86_64-linux-gnu/libstdc++.so.6 /app/lib
COPY --from=0 /lib/x86_64-linux-gnu/libm.so.6 /app/lib
COPY --from=0 /lib/x86_64-linux-gnu/libdl.so.2 /app/lib
COPY --from=0 /usr/lib/x86_64-linux-gnu/libsctp.so.1 /app/lib
COPY --from=0 /lib/x86_64-linux-gnu/libgcc_s.so.1 /app/lib
COPY --from=0 /lib/x86_64-linux-gnu/libc.so.6 /app/lib

ENV PATH="/app:$PATH"
ENV LD_LIBRARY_PATH="/app/lib:$LD_LIBRARY_PATH"

ENTRYPOINT ["sipp"]  



