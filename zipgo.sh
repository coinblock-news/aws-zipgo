#!/bin/bash

OUTPUT_DIR=$1
argc=$#

if [ $argc -lt 1 ]
then
  echo "usage: ./aws_zipgo.sh <OUTPUT_DIR>"
else
  echo "Building aws linux executable handler"
  GOOS=linux GOARCH=amd64 go build -o main *.go
  chmod +x main
  zip main.zip main
  mv main.zip $OUTPUT_DIR/
  mv main $OUTPUT_DIR/
fi
