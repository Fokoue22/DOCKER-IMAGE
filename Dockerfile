# specifying the base image 
FROM centos:7 

# discripe the function of your image
LABEL description="Building this image for Apache containers"
LABEL maintainer="Fokoue"

# Executing the command to upddate the package linux operating system
RUN yum -y update

#Executing the command to install httpd (Apache web server)
RUN yum -y install httpd

# copying the index file from local into the container at a specified destination
COPY index.html /var/www/html/

EXPOSE 80

# Start the container with httpd
# systemctl start httpd
ENTRYPOINT ["/usr/sbin/httpd"]

# systemctl enable httpd
# /usr/sbin/httpd -D FOREGROUND
CMD ["-D", "FOREGROUND"]


