#! /bin/bash

LD_LIBRARY_PATH=$LD_LIBRARY_PATH:"$(echo $(for i in /usr/share/pika/ld.so.d/*; do cat $i && echo -e "\n" ; done) | grep -v '^#' | tr '\n' ':' | tr ' ' ':')"