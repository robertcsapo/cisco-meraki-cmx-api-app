#!/bin/sh
if [ -n "$CMX_SECRET" ];
  then
    echo "CMX_SECRET is set"
  else
    echo "CMX_SECRET is missing, exiting..."
    exit 1
fi

if [ -n "$CMX_VALIDATOR" ];
  then
    echo "CMX_VALIDATOR is set"
  else
    echo "CMX_VALIDATOR is missing, exiting..."
    exit 1
fi

if [ -n "$CMX_BIND" ];
  then
    echo "CMX_BIND is set"
    ARG_CMX_BIND="-o "$CMX_BIND
  else
    ARG_CMX_BIND="-o 0.0.0.0"
fi
if [ -n "$CMX_PORT" ];
  then
    echo "CMX_PORT is set"
    ARG_CMX_PORT="-p "$CMX_PORT
  else
    ARG_CMX_PORT="-p 4567"
fi

echo "ruby /cmx-api-app/sample_location_server.rb $ARG_CMX_BIND $ARG_CMX_PORT $CMX_SECRET $CMX_VALIDATOR"
ruby /cmx-api-app/sample_location_server.rb $ARG_CMX_BIND $ARG_CMX_PORT $CMX_SECRET $CMX_VALIDATOR
