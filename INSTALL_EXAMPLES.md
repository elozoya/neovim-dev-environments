# INSTALL EXAMPLES

## Build and run with an example container configuration

1. Clone this repository
    ```
    git clone https://github.com/elozoya/neovim-dev-environments.git
    ```

## Build environment using the examples/build-dev-environment.sh script

1. Plain environment
    ```sh
    ./examples/build-dev-environment.sh plain
    ```
2. PHP
    ```sh
    ./examples/build-dev-environment.sh php
    ./examples/build-dev-environment.sh php 7.4
    ./examples/build-dev-environment.sh php 8.0
    ./examples/build-dev-environment.sh php 8.1
    ```
3. Go
    ```sh
    ./examples/build-dev-environment.sh go
    ./examples/build-dev-environment.sh go 1.19
    ```

## Run environment using the examples/run-dev-environment.sh script

1. Plain environment
    ```sh
    ./examples/run-dev-environment.sh plain
    ```
2. PHP
    ```sh
    ./examples/run-dev-environment.sh php
    ./examples/run-dev-environment.sh php 7.4
    ./examples/run-dev-environment.sh php 8.0
    ./examples/run-dev-environment.sh php 8.1
    ```
3. Go
    ```sh
    ./examples/run-dev-environment.sh go
    ./examples/run-dev-environment.sh go 1.19

    # run container with a port (go version omitted)
    ./examples/run-dev-environment.sh go "" 80

    # run container with a version and a port
    ./examples/run-dev-environment.sh go 1.19 80
    ```
