## Building the Custom rootfs image

Pull the GitHub repository and start building the custom rootfs image

```bash
git clone https://github.com/karuppiah7890/iximiuz-labs-postgresql-19-playground

cd iximiuz-labs-postgresql-19-playground

# Make any changes required in the Dockerfile
vi Dockerfile

docker build -t postgresql-19-test .

docker run --rm -it postgresql-19-test
```

## Fetching the Playground Manifest

Ensure you have the `labctl` CLI tool first

```bash
brew info labctl
brew install labctl
```

Then follow the below commands

```bash
labctl auth login

labctl auth whoami

labctl playground manifest postgresql-19-e92a0d56 > postgresql-19-e92a0d56-playground.yaml
```

## Updating the Playground with the Playground Manifest

Ensure you have the `labctl` CLI tool first

```bash
brew info labctl
brew install labctl
```

Then follow the below commands

```bash
labctl auth login

labctl auth whoami

# Make changes to the playground manifest
vi postgresql-19-e92a0d56-playground.yaml

# Update the playground with the playground manifest
labctl playground update postgresql-19-e92a0d56 -f postgresql-19-e92a0d56-playground.yaml
```

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
