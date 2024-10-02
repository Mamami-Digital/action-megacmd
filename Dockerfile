FROM debian:buster

LABEL version="1.0.1"
LABEL repository="http://github.com/Mamami-Digital/action-megacmd"
LABEL homepage="http://github.com/Mamami-Digital/action-megacmd"
LABEL maintainer="assistenza@mamami.digital"

LABEL com.github.actions.name="GitHub Action for MEGA"
LABEL com.github.actions.description="Wraps the megacmd CLI to enable interaction with MEGA."
LABEL com.github.actions.icon="upload-cloud"
LABEL com.github.actions.color="red"

RUN wget https://mega.nz/linux/repo/Debian_10.0/amd64/megacmd-Debian_10.0_amd64.deb && apt install megacmd-Debian_10.0_amd64.deb -y

ENV USERNAME NOBODY
ENV PASSWORD CHANGEME

COPY "entrypoint.sh" "/entrypoint.sh"
RUN chmod +x entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
