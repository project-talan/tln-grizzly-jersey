FROM openjdk:8u151-jre-alpine

ARG SERVICES_GJ_ARTIFACT
ARG SERVICES_GJ_HOST
ARG SERVICES_GJ_PORT

ENV SERVICES_GJ_ARTIFACT $SERVICES_GJ_ARTIFACT
ENV SERVICES_GJ_HOST $SERVICES_GJ_HOST
ENV SERVICES_GJ_PORT $SERVICES_GJ_PORT

RUN apk --update --no-cache add curl

COPY ./target/${SERVICES_GJ_ARTIFACT} /
HEALTHCHECK --interval=5s --timeout=3s CMD curl --fail http://localhost:${SERVICES_GJ_PORT}/healthcheck || exit 1

CMD exec java -jar /${SERVICES_GJ_ARTIFACT}
