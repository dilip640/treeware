FROM alpine:3.12.1

COPY entrypoint.sh /entrypoint.sh
COPY treeware_main.py /treeware_main.py
COPY get_releases.py /get_releases.py
COPY get_pull_requests.py /get_pull_requests.py
COPY extract_changelogs.py /extract_changelogs.py
COPY release.sh /release.sh
COPY drafter.yml /drafter.yml

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN apk add --no-cache \
    git \
    bash \
    gawk \
    hub \
    python3 \
    curl \
    jq \
    py3-pip
RUN pip3 install requests
RUN pip3 install pyyaml

ENTRYPOINT ["/entrypoint.sh"]