FROM node:17-bullseye as build
RUN apt-get update \
    && apt-get install -y ca-certificates-java openjdk-17-jre \
    && apt-get clean \
    && update-ca-certificates -f \
    && yarn global add @openapitools/openapi-generator-cli \
    && openapi-generator-cli version-manager set 5.3.1