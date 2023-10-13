#! /bin/bash

LD_LIBRARY_PATH=$LD_LIBRARY_PATH:"$(/usr/share/pika/ld.so.d/*.conf | grep -v '^#' | tr '\n' ':')"