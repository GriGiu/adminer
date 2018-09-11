# adminer
Test di utilizzo Docker e GitHub

Reference : https://www.adminer.org/en/ and https://hub.docker.com/r/dockette/adminer/ 

This is adminer full image (mysql, pgsql, sqlite, mongo) based on Alpine Linux:


# Usage
docker run \
    --rm
    -p 8000:80
    grigiu/adminer:latest

By default container is running with MEMORY=256M (memory_limit) and UPLOAD=2048M (upload_max_filesize, post_max_size). You can override it.

docker run \
    --rm
    -p 8000:80
    -e MEMORY=512M
    -e UPLOAD=4096M
    grigiu/adminer:latest
