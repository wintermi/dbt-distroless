# Build the image containing the dbt-project ready for execution
ARG PROJECT_ID
FROM gcr.io/${PROJECT_ID}/dbt/distroless:0.17.0
COPY project /dbt-project
COPY profiles /dbt-project/profiles

ENTRYPOINT ["/venv/bin/dbt-distroless.sh"]
