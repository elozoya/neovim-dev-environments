# Environments


1. Clone this repository
    ```
    git clone url
    ```

# Build environment using the bin/build-dev-environment.sh script

1. Plain environment
    ```sh
    ./bin/build-dev-environment.sh plain
    ```
2. PHP
    ```sh
    ./bin/build-dev-environment.sh php
    ```
3. Go
    ```sh
    ./bin/build-dev-environment.sh go
    ```

# Run environment using the bin/run-dev-environment.sh script

1. Plain environment
    ```sh
    ./bin/run-dev-environment.sh plain
    ```
2. PHP
    ```sh
    ./bin/run-dev-environment.sh php
    ```
3. Go
    ```sh
    ./bin/run-dev-environment.sh go
    # run container with a port
    ./bin/run-dev-environment.sh go 80
    ```

# Build environment manually with Docker

1. Plain environment
    ```sh
    docker build -t neovim/plain -f src/ubuntu/Dockerfile src/ubuntu
    ```
2. PHP environment
    ```sh
    docker build --build-arg NEOVIM_DEV_ENVIRONMENT=php -t neovim/php -f src/ubuntu/Dockerfile src/ubuntu
    ```
3. Go environment
    ```sh
    docker build --build-arg NEOVIM_DEV_ENVIRONMENT=go -t neovim/go -f src/ubuntu/Dockerfile src/ubuntu
    ```

# Run environment manually with docker

1. Plain environment
    ```sh
    docker run --rm -it neovim/plain
    ```
