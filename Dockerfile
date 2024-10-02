FROM debian:12-slim

LABEL version="1.0.2"
LABEL repository="http://github.com/Mamami-Digital/action-megacmd"
LABEL homepage="http://github.com/Mamami-Digital/action-megacmd"
LABEL maintainer="assistenza@mamami.digital"

LABEL com.github.actions.name="GitHub Action for MEGA"
LABEL com.github.actions.description="Wraps the megacmd CLI to enable interaction with MEGA."
LABEL com.github.actions.icon="upload-cloud"
LABEL com.github.actions.color="red"

RUN apt update && apt install wget -y && wget https://mega.nz/linux/repo/Debian_12/amd64/megacmd-Debian_12_amd64.deb && apt install ./megacmd-Debian_12_amd64.deb -y && apt clean

ENV USERNAME NOBODY
ENV PASSWORD CHANGEME

COPY "entrypoint.sh" "/entrypoint.sh"
RUN chmod +x entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
