#!/bin/bash
BE_IP=$3
BE_PORT=$4

psql -U postgres -h $BE_IP -c "select pg_is_in_recovery()" | head -n3 | tail -n1 | grep f