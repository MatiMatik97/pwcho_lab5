FROM scratch

LABEL maintainer="mateusz.kozak97@gmail.com"
LABEL description="Przykladowy Dockerfile dla serwera Apache & PHP."

ENV PHPVERSION=7

ADD alpine-minirootfs-3.12.1-x86_64.tar.gz /

RUN apk add --update apache2 php${PHPVERSION}-apache2 php${PHPVERSION} && \
        rm -rf /var/cache/apk/* && \
        # mkdir /run/apache2/ && \
        rm -rf /var/www/localhost/htdocs/index.html && \
        echo "<?php phpinfo(); ?>" > /var/www/localhost/htdocs/index.php && \
        chmod 755 /var/www/localhost/htdocs/index.php

EXPOSE 80/tcp
ENTRYPOINT ["httpd"]
CMD ["-D", "FOREGROUND"]
