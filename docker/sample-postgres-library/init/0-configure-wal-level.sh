#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "postgres" --dbname "postgres" <<-EOSQL
    ALTER SYSTEM SET wal_level to logical;
EOSQL