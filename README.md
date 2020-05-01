# Octodns Docker container
| ||
| --- | --- |
| License: |![GitHub](https://img.shields.io/github/license/8ear/docker-wordpress)|
| Github Workflow Build: | ![GitHub Workflow Status](https://img.shields.io/github/workflow/status/8ear/docker-octodns/8earDockerCI) |
| Docker Build Status: | ![Docker Build Status](https://img.shields.io/docker/cloud/build/8ear/octodns) |
| Docker Automated build: | ![Docker Automated build](https://img.shields.io/docker/cloud/automated/8ear/octodns) |
| Docker Pulls | ![Docker Pulls](https://img.shields.io/docker/pulls/8ear/octodns) |
| Docker latest tag: | ![Docker Image Version (tag latest semver)](https://img.shields.io/docker/v/8ear/octodns) |


Docker Container for OctoDNS https://github.com/github/octodns.
This docker repository creates with the support of Travis the docker container in hub.docker.com.

Docker Hub repository: https://hub.docker.com/r/8ear/octodns

## Local creation:
```bash
./make.sh
```

## Container Using

Docker run:
```
docker run --rm 8ear/octodns
```

Docker-compose:
```yaml
service:
    octodns:
        image: 8ear/octodns
        container_name: octodns
        env_file: .env_octodns
        volumes: 
        - ./DATA/octodns:/data
        commands: octodns-sync --config-file=/data/config.yml
```

