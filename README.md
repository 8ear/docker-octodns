# docker-octodns
Docker Container for OctoDNS https://github.com/github/octodns.
This docker repository creates with the support of Travis the docker container in hub.docker.com.

[![Build Status](https://travis-ci.org/8ear/docker-octodns.svg?branch=master)](https://travis-ci.org/8ear/docker-octodns)

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

