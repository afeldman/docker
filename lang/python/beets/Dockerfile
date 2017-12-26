FROM afeldman/python2

LABEL maintainer "anton.feldmann@gmail.com"

RUN pip install --no-cache-dir -U pip \
 && pip install --no-cache-dir beets flask flask-cors Mopidy-Beets Mopidy Mopidy-BeetsLocal

WORKDIR /opt/beets

COPY config.yaml /root/.config/beets/config.yml
COPY mopidy.conf /root/.config/mopidy/mopidy.conf

EXPOSE 6680 6600

CMD ["mopidy"]