#Docker Image rapping ytt binary

FROM alpine:3.17
RUN sed -i 's/https:/http:/g' /etc/apk/repositories && \
    apk add --no-cache ca-certificates && \
    apk add --no-cache sudo bash perl-utils wget curl
COPY hifield.crt /usr/local/share/ca-certificates/hifield.crt
COPY hifield.crt /etc/ssl/certs/ 
RUN  update-ca-certificates


# Download Carvel installer script
RUN wget -O install.sh https://carvel.dev/install.sh


# Run install script
RUN sed -i 's/mv /mv -f /g' install.sh && \
    bash install.sh
# Set default shell
SHELL ["/bin/bash", "-c"]