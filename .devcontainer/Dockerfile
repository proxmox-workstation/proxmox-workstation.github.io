FROM mcr.microsoft.com/devcontainers/base:noble

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y curl wget git dpkg-dev libudev-dev libclang-dev pkg-config reprepro expect
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > /rustup.sh
RUN chmod 755 /rustup.sh

USER vscode
RUN /rustup.sh -y