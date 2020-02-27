#!/bin/bash

url=$1
tool=$2

file="tmp.tar.gz"
wget -O $file $url >/dev/null 2>&1
rm -rf $tool
mkdir $tool
tar xzf $file -C $tool
rm -f $file
folder=`ls $tool`
mv $tool/$folder/* $tool/
rm -rf $tool/$folder
