#!/usr/bin/env bash

# Manage default values
if [ -z ${AAD_DOMAIN+x} ]; then
	AAD_DOMAIN=AAD
fi
if [ -z ${CSS_HOST+x} ]; then
	CSS_HOST=localhost
fi
if [ -z ${CSS_PORT+x} ]; then
	CSS_PORT=2280
fi
#if [ -z ${CSS_SCHEMA+x} ]; then
#	CSS_SCHEMA=xxx_measure
#fi
if [ -z ${CSS_USER+x} ]; then
	CSS_USER=operator
fi
if [ -z ${CSS_PASSWORD+x} ]; then
	CSS_PASSWORD=CastAIP
fi

# Deactivate Tomcat 7 and activate Tomcat 8
# TODO

# Handle CSS connection replacements
CONNEXION_FILE=webapps/CAST-AAD/META-INF/context.xml
sed -i 's/${domainName}/'"$AAD_DOMAIN"'/g' ${CONNEXION_FILE}
sed -i 's/${host}/'"$CSS_HOST"'/g' ${CONNEXION_FILE}
sed -i 's/${port}/'"$CSS_PORT"'/g' ${CONNEXION_FILE}
sed -i 's/${schema}/'"$CSS_SCHEMA"'/g' ${CONNEXION_FILE}
sed -i 's/${user}/'"$CSS_USER"'/g' ${CONNEXION_FILE}
sed -i 's/${password}/'"$CSS_PASSWORD"'/g' ${CONNEXION_FILE}

# Handle user authentification replacements
USER_FILE=webapps/CAST-AAD/WEB-INF/users.properties
sed -i '1 i\cast=cast,enabled,ROLE_ADMIN' $USER_FILE

exec "$@"
