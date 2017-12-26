FROM python:3

RUN set -x
RUN apt-get update -y && apt-get upgrade -y && apt-get install git
RUN pip3 install virtualenv

WORKDIR /opt

RUN git clone https://github.com/antingshen/BeaverDam.git \
    && cd BeaverDam \
    && pip3 install -r requirements.txt\
    && scripts/setup \
    && scripts/seed -f

ENV PATH /opt/BeaverDam/scripts:$PATH

CMD ["serve"]