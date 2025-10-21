# DOCKER-IMAGE
This repository contains docker images 

## Setup an Ansible cluster with the controller running on Amazon Linux 2 and the 4 nodes in which 2 running on Amazon linux and 2 running on ubuntu.

![Alt text](images/docker-architecture.png)


# STEPS BY STEPS PROCESS 

### 1. Launched amazon linux server:
![Alt text](images/docker-ec2-instance.png)


### 2. Installed docker in linux server:
- Take up you privilage. the first command for ubuntu and the second for linux. 
```
sudo su - ubuntu
```
```
sudo su - ec2-user
```
- let verifie if docker is install 
```
 docker --version
```
- After the verification we notice docker is not install. So we need to go to the officail documentation [this page](https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/install-docker.html) depending on our OS we follow the steps and install. For us is Installing Docker on Linux 
#### 1. Update the installed packages and package cache on your instance.
```
 sudo yum update -y
```
#### 2. Install the most recent Docker Community Edition package
```
 sudo yum install -y docker
```
#### 3. Start the Docker service.
```
 sudo service docker start
```
#### 4. Add the ec2-user to the docker group so that you can run Docker commands without using sudo.
```
 sudo usermod -a -G docker ec2-user
```
#### 5. This command keep our docker up at all time. No matter if our instance is stop docker will still be active in this server. 
```
 sudo systemctl enable docker
```
#### 6. Verify that the ec2-user can run Docker commands without using sudo.

```
 docker ps
```

![Alt text](images/docker-install-1.png)
![Alt text](images/docker-install-2.png)


### 3. Run our first container hello-word
```
 docker run hello-world

```
- Then verify our conatainer with  
```
 docker ps
```
![Alt text](images/ansible-playbook.png)
#### Nothing is been showing after runing the command docker ps because container a effermero. So we need to use the command below to be able to see or specified the port to keep the conatiner up at all time
```
 docker ps -a
```
![Alt text](images/hello-world-image.png)


## Author
FOKOUE THOMAS