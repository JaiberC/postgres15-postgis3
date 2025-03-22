#!/bin/bash

# Eliminar builder existente y crear uno nuevo
docker buildx rm postgisbuilder || true
docker buildx create --name postgisbuilder --use
docker buildx inspect --bootstrap

# Construir y publicar la imagen
docker buildx build \
    --network=host \
    --platform linux/amd64,linux/arm64 \
    -t jaiberc/postgres15-postgis3:latest \
    --push \
    .

# Si quieres también una versión con tag específico
docker buildx build \
    --network=host \
    --platform linux/amd64,linux/arm64 \
    -t jaiberc/postgres15-postgis3:0.4 \
    --push \
    .
