# How to use this

1. Install packer
2. Clone the repo
3. From the root of the repo with your GCP project set as an env variable run packer build nginx-rtmp-builder.json
4. enjoy your RTMP streaming server

- Notes
The server is based on ubuntu 16 using nginx 1.18 with the RTMP streaming module. Nginx as a systemd service is enabled.