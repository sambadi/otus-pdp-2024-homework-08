# pull official base image
FROM python:3.12.9-alpine

# set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

ENV APP_HOME=/app
RUN mkdir "${APP_HOME}"
RUN mkdir "${APP_HOME}/staticfiles"
WORKDIR $APP_HOME

RUN addgroup -S app && adduser -S app -G app -h ${APP_HOME}

# install dependencies
COPY --from=ghcr.io/astral-sh/uv:0.6.0-python3.12-alpine /usr/local/bin/uv /usr/local/bin/uvx /bin/

# Copy the project into the image
COPY . /app
ADD ./uv.lock /app/uv.lock
COPY ./pyproject.toml /app/pyproject.toml


RUN ls -l /app
COPY --chmod=755 ./docker-entrypoint.sh /app/entrypoint.sh

# chown all the files to the app user
RUN chown -R app:app "$APP_HOME"

# change to the app user
USER app


# Sync the project into a new environment, using the frozen lockfile
RUN uv sync --frozen --compile-bytecode
ENTRYPOINT ["/app/entrypoint.sh"]