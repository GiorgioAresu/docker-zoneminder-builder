# docker-zoneminder-builder
This container uses a [minimal ubuntu base image](https://github.com/phusion/baseimage-docker) to build deb packages for zoneminder.
It should be fairly simple to adapt it to use other base images for specific distros, if you so desire.

## Usage
1. Simple as

    ```sh
    docker run giorgioaresu/zoneminder-builder
    ```
    
    If you want to build a specific branch you can use the BRANCH environment variable, plus you'll probably want to name the image:
    
    ```sh
    docker run --name zm-builder -e BRANCH=feature-h264-storage giorgioaresu/zoneminder-builder
    ```
        
2. Once the container finishes, you can get the resulting packages with
    ```sh
    docker cp zm-builder:/deb ./
    ```

PS. You may be interested to [this](https://github.com/GiorgioAresu/docker-zoneminder-h264), or not :)
