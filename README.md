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

- Take up you privilage. the first command for ubuntu and the second for linux. 
```
sudo su - ubuntu
```
```
sudo su - ec2-user
```
### 8. Run ansible-playbook-project1.yml file
- First thing to do is to create this path "/root/web/index.html" for our index.html file on the controller, so we must have that file before running your playbook
```
 sudo mkdir -p /root/web
 echo "<h1>Hello from Ansible</h1>" | sudo tee /root/web/index.html

```
- The playbook need to be run in the controller as a root user 
```
 vi ansible-playbook-project1.yml
```
![Alt text](images/ansible-playbook.png)
#### Don't forget to update the host name with name present in your inventory file. 
- Then you run the command below to for ansible to run your playbook 
```
 ansible-playbook ansible-playbook-project1.yml
```
![Alt text](images/playbook-1.png)
![Alt text](images/playbook-2.png)


### 9. Connect to linux-node1 i.e. “ansible-linux-node1” and verify that index.html file is written in /var/www/html
```
 ls /var/www/html/
```
```
 cat /var/www/html/index.html
```
![Alt text](images/linux-verify-html.png)


### 10. Connect to ubuntu nodes i.e. “ubuntu-node” and verify that index.html file is written in /var/www/html

![Alt text](images/ubuntu-verify-html.png)


### 11. Verify GIT is installed in both linux and ubuntu nodes:
```
 git --version
```
![Alt text](images/linux-verify-git.png)

![Alt text](images/ubuntu-verify-git.png)


### 12. Use your "Public IPv4 address" to see the content of your html file 

![Alt text](images/webpage.png)

## Author
FOKOUE THOMAS