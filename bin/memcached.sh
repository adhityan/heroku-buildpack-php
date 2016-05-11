#!/usr/bin/env bash

dir=php-memcached
echo "-----> Installing memcached..."

### Redis
echo "[LOG] Downloading memcached"
git clone -b php7 https://github.com/php-memcached-dev/php-memcached.git -q
if [ ! -d "$dir" ]; then
  echo "[ERROR] Failed to find php memcached directory $dir"
  exit
fi

cd $dir
phpize
./configure --disable-memcached-sasl
make && make install

# /app/php/bin/phpize
# ./configure --enable-phalcon --with-php-config=$PHP_ROOT/bin/php-config
# make
# make install

echo "adding memcached.so into php.ini"
echo "extension=memcached.so" >> /app/.heroku/php/etc/php/php.ini