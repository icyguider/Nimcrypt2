FROM nimlang/nim

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
        gcc mingw-w64 xz-utils git

RUN nimble --accept install winim nimcrypto docopt ptr_math strenc
RUN git clone https://github.com/icyguider/Nimcrypt2.git && \
        cd Nimcrypt2 && \
        nim c -d=release --cc:gcc --embedsrc=on --hints=on --app=console --cpu=amd64 --out=nimcrypt nimcrypt.nim

RUN cp /Nimcrypt2/nimcrypt /nimcrypt && \
        cp /Nimcrypt2/syscalls.nim / && \
        mkdir pack && cd /

CMD ["./nimcrypt"]
