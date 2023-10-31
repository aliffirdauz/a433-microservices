#!/bin/bash

# Nama Docker image yang akan dibuat
image_name="item-app"

# Tag untuk Docker image
image_tag="v1"

# Nama paket GitHub (ganti dengan nama paket GitHub yang sesuai)
github_package="aliffirdauz/a433-microservices/tree/proyek-pertama"

# Langkah 1: Membuat Docker image dari Dockerfile
docker build -t "$image_name:$image_tag" .

# Langkah 2: Melihat daftar image di lokal
docker images

# Langkah 3: Mengubah nama image sesuai format GitHub Packages
new_image_name="docker.pkg.github.com/$github_package/$image_name"
new_image_tag="$new_image_name:$image_tag"

docker tag "$image_name:$image_tag" "$new_image_tag"

# Langkah 4: Login ke GitHub Packages (menggunakan personal access token)
# Gantilah dengan personal access token GitHub Anda
docker login docker.pkg.github.com -u aliffirdauz -p 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

# Langkah 5: Mengunggah image ke GitHub Packages
docker push "$new_image_tag"