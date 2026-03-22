FROM alpine

RUN apk add --no-cache curl
RUN apk add --no-cache bash
RUN apk add --no-cache aws-cli

COPY ddns-route53 /usr/local/bin/ddns-route53

ENTRYPOINT ["/usr/local/bin/ddns-route53"]