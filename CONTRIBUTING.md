## Debugging Docker builds

To debug what's being sent as part of the build context, please use the `Dockerfile.debug` file like this -

```bash
DOCKER_BUILDKIT=0 docker build --file Dockerfile.debug .
```

Accordingly modify the `.dockerignore` file

And if the build is cached, use below to create a new build without cache

```bash
DOCKER_BUILDKIT=0 docker build --no-cache --file Dockerfile.debug .
```
