# GitHub Container Registery
Crear token de acceso (classic):
https://github.com/settings/tokens

## Iniciar sesión con el token:
```sh
echo [TOKEN] | docker login ghcr.io -u rockodev --password-stdin
```

## Construir y subir nueva versión de imagen:
```sh
docker buildx build --platform linux/amd64,linux/arm64 -t ghcr.io/rockodev/php-with-mongodb:8.4.8 . --push
```

Actualizar imagen de contenedor:
```sh
docker pull ghcr.io/rockodev/php-with-mongodb:8.4.8
```

## Actualizar etiqueta latest con la última versión:
```sh
docker tag ghcr.io/rockodev/php-with-mongodb:8.4.8 ghcr.io/rockodev/php-with-mongodb:latest
docker push ghcr.io/rockodev/php-with-mongodb:latest
```

## Ejecutar:
```sh
docker run --rm --env-file=.env --pull=always ghcr.io/rockodev/php-with-mongodb:latest
```
