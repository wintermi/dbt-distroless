#!/bin/sh

. /venv/bin/activate
/venv/bin/dbt run --project-dir "/dbt-project/" --profiles-dir "/dbt-project/profiles/" "$@"
