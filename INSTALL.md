# Environments


1. Clone this repository
    ```
    git clone url
    ```

# Build environment

1. Plain environment
    ```sh
    docker build -t neovim-7.2/plain -f src/ubuntu/Dockerfile src/ubuntu
    ```
2. PHP environment
    ```sh
    docker build --build-arg NEOVIM_DEV_ENVIRONMENT=php -t neovim-7.2/php -f src/ubuntu/Dockerfile src/ubuntu
    ```
3. Go environment
    ```sh
    docker build --build-arg NEOVIM_DEV_ENVIRONMENT=go -t neovim-7.2/go -f src/ubuntu/Dockerfile src/ubuntu
    ```

# Run environment using the bin/run-container.sh script

1. Plain environment
    ```sh
    ./bin/run-container.sh plain
    ```
2. PHP
    ```sh
    ./bin/run-container.sh php
    ```
3. Go
    ```sh
    ./bin/run-container.sh go
    # run container with a port
    ./bin/run-container.sh go 80
    ```

# Run environment with docker

1. Plain environment
    ```sh
    docker run --rm -it neovim/plain
    ```
