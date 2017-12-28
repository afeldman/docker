FROM afeldman/haskell:latest

LABEL maintainer "anton.feldmann@gmail.com"

RUN apk upgrade --update-cache --available\
 && apk add --no-cache git

RUN stack config set system-ghc --global true &&\
    stack install alex happy llvm-hs-pure

RUN cabal update

WORKDIR /opt/

ARG TEST="NO"

RUN git clone https://github.com/BNFC/bnfc.git /opt/bnfc \
    && cd /opt/bnfc/source \
    && if [ ${TEST} != "NO" ]; then \
       cabal sandbox init; \
       cabal install --only-dependencies --enable-tests; \
       cabal configure --enable-tests; \
       cabal build; \
       cabal test; \
    else \
        cabal install; \
    fi
    