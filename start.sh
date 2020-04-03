#!/bin/sh

if [ -d /opt/etc/apache2 ]; then
    echo Starting Apache with local configuration.
    export APACHE_ENVVARS=/opt/etc/apache2/envvars
fi

/etc/init.d/php7.0-fpm start

apache2ctl -D FOREGROUND
