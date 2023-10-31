#!/bin/bash

export X509_USER_PROXY=$(voms-proxy-info -path)
export HERE=$PWD

tar -czvf package.tar.gz testCondor.py

mkdir -p condorTest-logs/ 

condor_submit testCondor.sub
