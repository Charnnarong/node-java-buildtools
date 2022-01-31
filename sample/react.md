# Simple Dockerfile for CRA. 

```dockerfile
FROM ghcr.io/charnnarong/node-java-buildtools:release as build
WORKDIR /code
COPY . .
RUN ls -liash
RUN yarn install --frozen-lockfile \
    && openapi-generator-cli generate -g typescript-fetch -i api/petstore.yml -o src/generated/petstore -c api/config.yml \
    && yarn build

# NGINX web server
FROM nginx:1.21.5-alpine as prod
COPY --from=build /code/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
```

where `api/config/config.yml` could be
```yaml
additionalProperties:
  withInterfaces: true
  typescriptThreePlus: true
  supportsES6: true
```
