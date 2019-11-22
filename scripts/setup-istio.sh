#!/bin/bash

# this attempts to set up istio 

echo "***"
echo "*** Warning - this script will download and unpack files in `pwd` - control C to stop or return to continue"
echo "***"

read


PLATFORM=`uname`
echo "Running on $PLATFORM"

if [ x$PLATFORM = xDarwin ] ; then 
    ARCHIVE=istio-1.4.0-osx.tar.gz
elif [ x$PLATFORM = xLinux ] ; then
    ARCHIVE=istio-1.4.0-linux.tar.gz
else 
    echo "Unknown platform - exiting"
    exit 1;
fi

wget https://github.com/istio/istio/releases/download/1.4.0/$ARCHIVE && tar -xzf $ARCHIVE && rm -f $ARCHIVE

if [ ! -f ./istio-1.4.0/bin/istioctl ] ; then 
    echo "no istioctl - exiting" 
    exit 1 
fi


echo "Loading istio to the cluster" 

./istio-1.4.0/bin/istioctl manifest apply --set profile=demo

echo "Checking " 

echo "services" 

kubectl get svc -n istio-system

echo "pods" 

kubectl get po -n istio-system

echo "adding auto injection"

kubectl label namespace default istio-injection=enabled

echo "checking" 

kubectl get namespace -L istio-injection




