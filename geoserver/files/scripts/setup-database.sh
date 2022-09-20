#!/bin/bash
set -e -u 

set -x

{ psql -ltA -R ';' | awk -F '|' -v RS=';' '{print $1}' | grep -qFx -e ${PGDATABASE}; } || \
  createdb -e -O ${POSTGIS_USER} ${PGDATABASE}

psql -e -c 'CREATE EXTENSION IF NOT EXISTS postgis'
