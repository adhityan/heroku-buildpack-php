#!/usr/bin/env bash

echo "-----> Installing Libmemcached..."
wget http://launchpad.net/libmemcached/1.0/1.0.18/+download/libmemcached-1.0.18.tar.gz
tar -zxvf libmemcached-1.0.18.tar.gz
cd libmemcached-1.0.18
./configure
make && make install
pecl install memcached