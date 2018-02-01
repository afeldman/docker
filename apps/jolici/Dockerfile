FROM afeldman/php

VOLUME /project

RUN curl https://github.com/jolicode/JoliCi/releases/download/v0.3.1/jolici.phar -o /usr/local/bin/jolici
RUN chmod +x /usr/local/bin/jolici

RUN php /usr/local/bin/jolici run

CMD ["php","jolici.phar","run","-p","/project"]
