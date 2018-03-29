#!/usr/bin/env bash

echo 'The following command terminates the "mvn -pl webgoat-server spring-boot:run" process using its PID'
echo '(written to ".pidfile"), all of which were conducted when "run.sh"'
echo 'was executed.'
set -x
kill $(cat .pidfile)