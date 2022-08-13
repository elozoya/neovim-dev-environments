FROM ubuntu:22.04

LABEL maintainer="Emmanuel Lozoya"

# Setup arguments
ARG TIMEZONE=America/Monterrey
ARG LOCALE=en_US.UTF-8

# User arguments
ARG USER_ID=1000
ARG GROUP_ID=1000
ARG USER_NAME=docker
ARG USER_GROUP_NAME=docker
ARG USER_PASS=docker
ARG USER_SHELL=zsh
ARG NEOVIM_VERSION=STABLE
ARG NEOVIM_CHECKHEALTH=FULL

ARG NEOVIM_DEV_ENVIRONMENTS_ROOT=/neovim-dev-environments
ARG NEOVIM_DEV_ENVIRONMENT=plain

ADD common $NEOVIM_DEV_ENVIRONMENTS_ROOT/common
ADD environments $NEOVIM_DEV_ENVIRONMENTS_ROOT/environments

RUN DEBIAN_FRONTEND=noninteractive; \
    chmod +x $NEOVIM_DEV_ENVIRONMENTS_ROOT/common/*.sh \
    && find $NEOVIM_DEV_ENVIRONMENTS_ROOT/environments -type f -name "*.sh" -exec chmod +x {} \; \
    && $NEOVIM_DEV_ENVIRONMENTS_ROOT/common/setup_timezone_and_locale.sh \
    && $NEOVIM_DEV_ENVIRONMENTS_ROOT/common/add_user.sh \
    && $NEOVIM_DEV_ENVIRONMENTS_ROOT/common/install_neovim.sh \
    && $NEOVIM_DEV_ENVIRONMENTS_ROOT/common/install_extras.sh \
    && $NEOVIM_DEV_ENVIRONMENTS_ROOT/common/install_dev_environment.sh

ENV LC_ALL=$LOCALE \
    LANG=$LOCALE \
    LANGUAGE=$LOCALE \
    HOME=/home/$USER_NAME \
    NEOVIM_DEV_ENVIRONMENTS_ROOT=$NEOVIM_DEV_ENVIRONMENTS_ROOT \
    NEOVIM_DEV_ENVIRONMENT=$NEOVIM_DEV_ENVIRONMENT \
    USER_SHELL=$USER_SHELL \
    SHELL="/bin/$USER_SHELL"

USER $USER_NAME
WORKDIR "$HOME"

RUN $NEOVIM_DEV_ENVIRONMENTS_ROOT/common/install_vim_plug.sh

CMD ["sh", "-c", "$SHELL"]
