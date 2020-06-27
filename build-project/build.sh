#!/bin/bash

if [[ $# -ne 1 ]]; then
    echo "Usage: build.sh <dbt-version-number>"
    echo ""
    echo "**** WARNING: No dbt version number specified, defaulting to 0.17.0"
    echo ""
    dbt_version="0.17.0"
else
    dbt_version=$1
fi

gcloud builds submit --config build.yaml \
  --substitutions=TAG_NAME="${dbt_version}"

