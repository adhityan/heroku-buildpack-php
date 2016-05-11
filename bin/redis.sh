#!/usr/bin/env bash

redis_dir=phpredis
echo "-----> Installing Redis..."

### Redis
echo "[LOG] Downloading Redis"
git clone -b php7 https://github.com/phpredis/phpredis.git -q
if [ ! -d "$redis_dir" ]; then
  echo "[ERROR] Failed to find php redis directory $redis_dir"
  exit
fi

cd $redis_dir
phpize
./configure
make && make install

# /app/php/bin/phpize
# ./configure --enable-phalcon --with-php-config=$PHP_ROOT/bin/php-config
# make
# make install

echo "important extension redis into php.ini"
echo "extension=redis.so" >> /app/.heroku/php/etc/php/php.ini