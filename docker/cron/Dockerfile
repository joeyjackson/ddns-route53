FROM amazon/aws-cli:latest
ENTRYPOINT []

ARG UPDATE_FREQUENCY_MINUTES=30

# Install supercronic: https://github.com/aptible/supercronic/releases/tag/v0.2.44
ENV SUPERCRONIC_URL=https://github.com/aptible/supercronic/releases/download/v0.2.44/supercronic-linux-amd64 \
    SUPERCRONIC=supercronic-linux-amd64

RUN curl -fsSLO "$SUPERCRONIC_URL" \
 && chmod +x "$SUPERCRONIC" \
 && mv "$SUPERCRONIC" "/usr/local/bin/${SUPERCRONIC}" \
 && ln -s "/usr/local/bin/${SUPERCRONIC}" /usr/local/bin/supercronic

COPY ddns-route53 /usr/local/bin/ddns-route53
RUN chmod +x /usr/local/bin/ddns-route53

COPY docker/cron/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

RUN echo "*/$UPDATE_FREQUENCY_MINUTES * * * * /usr/local/bin/ddns-route53" > crontab

CMD ["/entrypoint.sh"]