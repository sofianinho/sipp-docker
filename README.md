# SIPp for docker

This project aims at having a modern, best paractices compliant docker image for the SIPp software.
Docker is for the ease of use and deployment mainly.


## Versioning

### Software version

If you rebuild the docker image on your machine, you should be able to change sotware versions very easily by changing the value of the `SIPP_VERSION` variable through docker args. The default version will be the latest avaiable at the time of writing (`3.5.2`).

### Base image

The docker base image used will be either:

- Ubuntu 18.04
- Debian stretch
- Alpine 3.8

## LICENSE

MIT for this project. The licensing for the SIPp software is available in the original [repo](http://sipp.sourceforge.net/).
