# INSTALL

## Build and run without a container configuration

1. Clone this repository
    ```
    git clone https://github.com/elozoya/neovim-dev-environments.git
    ```

### Build environment manually with Docker

1. Plain environment
    ```sh
    docker build -t neovim/plain -f src/ubuntu/Dockerfile src/ubuntu
    ```
2. PHP environment
    ```sh
    docker build --build-arg NEOVIM_DEV_ENVIRONMENT=php -t neovim/php -f src/ubuntu/Dockerfile src/ubuntu
    docker build --build-arg NEOVIM_DEV_ENVIRONMENT=php NEOVIM_DEV_ENVIRONMENT_VERSION=7.4 -t neovim/php7.4 -f src/ubuntu/Dockerfile src/ubuntu
    docker build --build-arg NEOVIM_DEV_ENVIRONMENT=php NEOVIM_DEV_ENVIRONMENT_VERSION=8.0 -t neovim/php8.0 -f src/ubuntu/Dockerfile src/ubuntu
    docker build --build-arg NEOVIM_DEV_ENVIRONMENT=php NEOVIM_DEV_ENVIRONMENT_VERSION=8.1 -t neovim/php8.1 -f src/ubuntu/Dockerfile src/ubuntu
    ```
3. Go environment
    ```sh
    docker build --build-arg NEOVIM_DEV_ENVIRONMENT=go -t neovim/go -f src/ubuntu/Dockerfile src/ubuntu
    docker build --build-arg NEOVIM_DEV_ENVIRONMENT=go NEOVIM_DEV_ENVIRONMENT_VERSION=1.19 -t neovim/go1.19 -f src/ubuntu/Dockerfile src/ubuntu
    ```

### Run environment manually with docker

1. Plain environment
    ```sh
    docker run --rm -it neovim/plain
    ```
2. PHP environment
    ```sh
    docker run --rm -it neovim/php
    docker run --rm -it neovim/php7.4
    docker run --rm -it neovim/php8.0
    docker run --rm -it neovim/php8.1
    ```
3. Go environment
    ```sh
    docker run --rm -it neovim/go
    docker run --rm -it neovim/go1.19
    ```
