# Setup the build Linux and Python environments
FROM debian:buster-slim AS build
COPY pack /tmp/pack
RUN  apt-get update \
     &&  apt-get install --no-install-suggests --no-install-recommends --yes python3-venv gcc libpython3-dev \
     &&  python3 -m venv /venv \
     &&  /venv/bin/pip install --upgrade pip \
     &&  /venv/bin/pip install -r /tmp/pack/requirements.txt \
     &&  cp /tmp/pack/*.sh /venv/bin/

# Copy the virtualenv into a distroless image
FROM gcr.io/distroless/python3-debian10
COPY --from=build /venv /venv

ENTRYPOINT ["/venv/bin/dbt-root.sh"]
