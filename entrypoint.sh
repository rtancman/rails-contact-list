#!/bin/bash
rm -f /var/app/tmp/pids/server.pid

bundle check > /dev/null 2>&1 || bundle install --local

if [ "$#" == 0 ]
then
  exec bundle exec rails s -p 8080 -b '0.0.0.0'
fi

exec $@
