#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "postgres" <<-EOSQL
create role $USER_NAME with login password '$USER_PASSWORD';

CREATE DATABASE db0
  WITH OWNER = $USER_NAME
       ENCODING = 'UTF8'
       LC_COLLATE = 'en_US.utf8'
       LC_CTYPE = 'en_US.utf8'
       connection limit = -1;

CREATE SCHEMA $SCHEMA_NAME AUTHORIZATION $USER_NAME;

alter database db0 set time zone 'Europe/Moscow';

grant all on database db0 to $USER_NAME;
revoke all on database db0 from public;
revoke create on schema public from public;

GRANT CONNECT ON DATABASE db0 TO $USER_NAME;
GRANT CREATE ON DATABASE db0 TO $USER_NAME;
GRANT TEMPORARY ON DATABASE db0 TO $USER_NAME;

\c $USER_NAME;
CREATE EXTENSION btree_gist;
CREATE EXTENSION tablefunc;
EOSQL

{ echo "host db0 $USER_NAME 0.0.0.0/0 trust"; } >> "$PGDATA/pg_hba.conf"