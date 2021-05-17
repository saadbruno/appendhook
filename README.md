# Appendhook

A simple way to push new lines in text files to Discord using webhooks. 

It's useful if you wanna push some **log files** or maybe irssi notifications (using [fnotify](https://github.com/irssi/scripts.irssi.org/blob/master/scripts/fnotify.pl)) to Discord.

This script will read any new lines added to a text file, and send a webhook with its contents.

## Usage
`docker run --name appendhook -v /path/to/file:/app/watchfile:ro --env WEBHOOK_URL=https://discord.com/api/webhooks/1234567890/abcdefabcdefabcdef saadbruno/appendhook:latest`

or with docker-compose:

```
version: '3.3'
services:
    appendhook:
        container_name: appendhook
        volumes:
            - '/path/to/file:/app/watchfile:ro'
        environment:
            - 'WEBHOOK_URL=https://discord.com/api/webhooks/1234567890/abcdefabcdefabcdef'
        image: 'saadbruno/appendhook:latest'
        restart: unless-stopped
```