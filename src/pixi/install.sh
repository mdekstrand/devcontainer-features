#!/bin/bash

set -xeuo pipefail

PIXI_ARCH=$(uname -m | sed -e 's/arm64/aarch64/')

GH_REPO="prefix-dev/pixi"
GH_RELEASE_DL="https://github.com/${GH_REPO}/releases/latest/download/"

FILE="pixi-${PIXI_ARCH}-unknown-linux-musl.tar.gz"

mkdir -p /opt/pixi/bin
curl -fsSL "$GH_RELEASE_DL/$FILE" | tar xvzf - -C /opt/pixi/bin

cat >"/opt/pixi/config.toml" <<EOF
detached-environments = "/opt/pixi/envs"
EOF
