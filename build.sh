#!/bin/sh
set -e

#   save <seconds> <changes>
#   Will save the DB if both the given number of seconds and the given
#   In the example below the behaviour will be to save:
#   Note: you can disable saving at all commenting all the "save" lines.
#   It is also possible to remove all the previously configured save
#   points by adding a save directive with a single empty string argument
#   save ""
sed -i "s/save 900 1/save 60 1/g" /etc/redis.conf
sed -i "s/save 300 10/save 30 10/g" /etc/redis.conf
sed -i "s/save 60 10000/save 1 100/g" /etc/redis.conf

sed -i 's/^\(bind .*\)$/# \1/' /etc/redis.conf 
sed -i 's/^\(daemonize .*\)$/# \1/' /etc/redis.conf
sed -i 's/^\(dir .*\)$/# \1\ndir \/data/' /etc/redis.conf
sed -i 's/^\(logfile .*\)$/# \1/' /etc/redis.conf

exec "$@"
