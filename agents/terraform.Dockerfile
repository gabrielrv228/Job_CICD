FROM ubuntu:20.04
RUN apt-get update

RUN DEBIAN_FRONTEND=noninteractive apt install -y tzdata

RUN apt-get install -y python3 gnupg software-properties-common curl git

RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -

RUN apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" 

RUN apt update && apt-get install terraform

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
