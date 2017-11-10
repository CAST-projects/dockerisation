#!/usr/bin/env bash

# Manage default values
if [ -z ${DELIVERY_FOLDER+x} ]; then
	DELIVERY_FOLDER=/usr/local/castdelivery
fi

# Make sure the folder exists
#mkdir $DELIVERY_FOLDER
#chmod +x $DELIVERY_FOLDER

# Handle CSS connection replacements
CONNEXION_FILE=webapps/CAST-AICP/WEB-INF/web.xml
sed -i 's~${sourceCodeDeliveryFolderPath}~'"$DELIVERY_FOLDER"'~g' ${CONNEXION_FILE}

exec "$@"
