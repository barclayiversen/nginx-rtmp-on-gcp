# How to use this

1. Install packer
2. Clone the repo
3. cd into the packer folder
4. build the image 
5. cd into the terraform folder
6. apply the infra with the newly built image
7. enjoy your rtmp streaming server

- Notes
The server is based on ubuntu 16 using nginx 1.18 with the RTMP streaming module. Nginx as a systemd service is enabled.

# TODO 

1. Move first shell provisioner into file
2. Terraform remote state