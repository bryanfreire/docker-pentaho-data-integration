# docker-pentaho-data-integration
Pentaho data integration kettle as gui application inside a docker container

## Build
```
docker build -t pdi:8.3 .
```

## Run
```
xhost + && \
docker run \
    --rm \
    -it \
    --net=host \
    -e DISPLAY=:0 \
    pdi:8.3
```

### Notes
Add volumes to the run in order to save changes from the container into the host.

Example:
```
docker run \
    --rm \
    -it \
    --net=host \
    -e DISPLAY=:0 \
    -v $PWD/config/.spoonrc:/root/.kettle/.spoonrc \
    -v $PWD/config/kettle.properties:/root/.kettle/kettle.properties \
    -v $PWD/etl/:/root/etl/ \
    pdi:8.3
```
