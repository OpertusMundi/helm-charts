# vim: set syntax=dockerfile:

FROM debian:11.8-slim

RUN apt-get update && apt-get install -y openssh-server rsync

ARG uid="1000"
# see:
# https://stackoverflow.com/questions/73208471/docker-build-issue-stuck-at-exporting-layers
# https://stackoverflow.com/questions/48671214/docker-image-size-for-different-user
RUN useradd --no-log-init --uid ${uid} --create-home --shell /bin/bash user1

ENV HOME "/home/user1"
USER user1
