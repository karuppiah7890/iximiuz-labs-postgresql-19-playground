#!/bin/bash

sudo su postgres -c "/usr/local/pgsql/bin/pg_ctl -D /usr/local/pgsql/data initdb"

sudo mkdir -p /var/log/postgresql

sudo chown postgres /var/log/postgresql

sudo su postgres -c "/usr/local/pgsql/bin/pg_ctl -D /usr/local/pgsql/data -l /var/log/postgresql/logfile start"
