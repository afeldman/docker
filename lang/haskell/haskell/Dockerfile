FROM afeldman/llvm:latest

LABEL maintainer "anton.feldmann@gmail.com"

RUN apk upgrade --update-cache --available\
 && apk add --no-cache \
        cabal \
        ghc-dev \
        ghc 

# Haskell stack
RUN curl -sSL https://get.haskellstack.org/ | sh

RUN echo "LLVM Version: $(llvm-config --version)"

RUN stack update && \
    stack upgrade

ENV PATH /usr/local/bin/:$PATH
ENV PATH /root/.local/bin:$PATH
ENV PATH /root/.cabal/bin:$PATH

CMD [ "bash" ]