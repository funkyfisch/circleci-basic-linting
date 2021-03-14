FROM cimg/base:edge-20.04

USER root

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apt-get -qq update \
  && apt-get install -qq \
    --no-install-recommends \
    shellcheck \
    yamllint \
  && apt-get -qq clean \
  && rm -rf /var/lib/apt/lists/* \
  && curl -s https://api.github.com/repos/hadolint/hadolint/releases/latest \
    | grep browser_download_url \
    | grep Linux-x86 \
    | cut -d '"' -f 4 \
    | wget -qi - -O /usr/local/bin/hadolint \
  && chmod +x /usr/local/bin/hadolint


USER circleci
