#!/bin/sh

# Run update script once on startup
/usr/local/bin/ddns-route53

# Start cronjob
/usr/local/bin/supercronic crontab