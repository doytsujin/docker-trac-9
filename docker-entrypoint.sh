#!/bin/bash
set -eu

if [ ! -d /var/trac ]
then
	mkdir /var/trac
fi

if [ -f /var/tracwork/trac.wsgi -a  ! -f /var/trac/trac.wsgi ]
then
	cp  /var/tracwork/trac.wsgi /var/trac/trac.wsgi
fi

if [ -f /var/tracwork/set-trac-env.sh -a  ! -f /var/trac/set-trac-env.sh ]
then
	cp  /var/tracwork/set-trac-env.sh /var/trac/set-trac-env.sh
fi

if [ ! -f /var/trac/project/VERSION ]
	exec /var/trac/set-trac-env.sh -o "project"
then

fi

chown -R www-data:www-data /var/trac/
chmod -R 775 /var/trac/
cp -f /var/tracwork/httpd.conf /usr/local/apache2/conf/httpd.conf
rm -rf /var/tracwork

httpd -k stop

exec "$@"



