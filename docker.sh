#!/bin/sh
docker run -it -p 1883:1883 -p 5672:5672 -p 61613:61613 -p 61614:61614 -p 8161:8161 rmohr/activemq

