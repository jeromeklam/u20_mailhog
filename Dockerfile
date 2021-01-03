# Version 1.0.1

FROM jeromeklam/u20
MAINTAINER Jérôme KLAM, "jerome.klam@jvs.fr"

#
ENV DEBIAN_FRONTEND noninteractive

#
RUN cd ~
RUN go get github.com/mailhog/MailHog
RUN ln -sf /opt/go/bin/MailHog /usr/bin/MailHog

RUN useradd mailhog

USER mailhog

WORKDIR /home/mailhog

# Expose the SMTP and HTTP ports:
EXPOSE 1025 8025

ENTRYPOINT ["MailHog"]
