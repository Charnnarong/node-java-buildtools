FROM node:17.4.0-buster as build
RUN apt-get update \
    && apt-get install -y ca-certificates-java \
    && apt-get clean \
    && update-ca-certificates -f \
    && yarn global add @openapitools/openapi-generator-cli \
    && openapi-generator-cli version-manager set 5.3.1
RUN node -v 
RUN java --version
RUN openapi-generator-cli version
