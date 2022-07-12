FROM ubuntu:20.04
<<<<<<< HEAD
COPY . /.Secret 
=======
>>>>>>> 69ed7bcf7ddd04449743e32454fda412e36c0aaf
RUN apt-get update

RUN DEBIAN_FRONTEND=noninteractive apt install -y tzdata

RUN apt-get install -y python3 gnupg software-properties-common curl git

RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -

RUN apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" 

RUN apt update && apt-get install terraform

<<<<<<< HEAD
=======
EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
>>>>>>> 69ed7bcf7ddd04449743e32454fda412e36c0aaf
