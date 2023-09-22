FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive

# install prerequisites
RUN apt-get update && apt-get -y install curl gnupg && rm -rf /var/lib/apt/lists/*

# use the official install script and clean up apt packages after
RUN curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | bash && rm -rf /var/lib/apt/lists/*

# now install the client
RUN apt-get update && apt-get -y install speedtest && rm -rf /var/lib/apt/lists/*

# accept the eula. we do this now so it doesnt display a banner during run
RUN mkdir -p ~/.config/ookla && echo '{ "Settings": { "LicenseAccepted": "604ec27f828456331ebf441826292c49276bd3c1bee1a2f65a6452f505c4061c" } }' > ~/.config/ookla/speedtest-cli.json

ENTRYPOINT [ "speedtest" ]
