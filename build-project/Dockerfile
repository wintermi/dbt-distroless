# Build the image containing the dbt-project ready for execution
ARG PROJECT_ID
ARG TAG_NAME
FROM gcr.io/${PROJECT_ID}/dbt/distroless:${TAG_NAME}
COPY project /dbt-project
COPY profiles /dbt-project/profiles

ENTRYPOINT ["/venv/bin/dbt-run.sh"]
