
##
##Dockerfile to build Liferay Community Edition Portal 7.0.3 GA3
##Based on ubuntu 14.04                                                                                                                                  
##

# Set the base image to ubuntu
FROM ubuntu:14.04

# Install Java 8 JDK
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y  software-properties-common && \
    add-apt-repository ppa:webupd8team/java -y && \
    apt-get update && \
    echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
    apt-get install -y oracle-java8-installer && \
    apt-get clean
ENV JAVA_HOME=/usr/lib/jvm/java-8-oracle
ENV JRE_HOME=$JAVA_HOME/jre
ENV PATH=$PATH:$JAVA_HOME/bin

#create the folder to contain bundled Liferay tomcat files, it is an absolute path
RUN mkdir -p /usr/liferay/docker/appserver/LR-CE-PORTAL-7.0-GA3

#Copy the LR tomcat bundle folders/files to container
COPY LR-CE-PORTAL-7.0-GA3/ /usr/liferay/docker/appserver/LR-CE-PORTAL-7.0-GA3/

#MAKE the whole Tomcat folder as the mounted directory
VOLUME /usr/liferay/docker/appserver/LR-CE-PORTAL-7.0-GA3

# Expose port 8080
EXPOSE 8080
