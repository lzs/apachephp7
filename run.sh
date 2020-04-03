#!/bin/sh

docker run -it -p 8080:80 --name info -d -v /opt/testtest:/opt -v /opt/var:/var/lib/php zitseng/apachephp7
