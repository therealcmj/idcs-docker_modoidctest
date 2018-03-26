#!/bin/bash

. settings.sh

#docker rmi $IMGNAME

docker build -t $IMGNAME .
#docker tag $IMGNAME $IMGNAME:1
