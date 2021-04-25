#!/bin/bash

# vars
BACKUP_DIR=/home/javier/odoo/docker-compose_odoo/backups_odoo
ODOO_DATABASE=odoo14c_sr-robot
ADMIN_PASSWORD=vmtm-y75d-ajsj

# create a backup directory
mkdir -p ${BACKUP_DIR}

# create a backup
curl -X POST \
    -F "master_pwd=${ADMIN_PASSWORD}" \
    -F "name=${ODOO_DATABASE}" \
    -F "backup_format=zip" \
    -o ${BACKUP_DIR}/${ODOO_DATABASE}.$(date +%F).zip \
    http://sr-robot.info/web/database/backup

# delete old backups
find ${BACKUP_DIR} -type f -mtime +7 -name "${ODOO_DATABASE}.*.zip" -delete
