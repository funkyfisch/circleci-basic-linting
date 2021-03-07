FROM cimg/base:edge-20.04

USER root

RUN apt-get update \
  && apt-get install -y --no-install-recommends shellcheck \
  && curl -s https://api.github.com/repos/hadolint/hadolint/releases/latest \
    | grep browser_download_url \
    | grep Linux-x86 \
    | cut -d '"' -f 4 \
    | wget -qi - -O /usr/local/bin/hadolint \
  && chmod +x /usr/local/bin/hadolint

USER circleci
