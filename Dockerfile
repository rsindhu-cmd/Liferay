
FROM ubuntu:18.04

# Install Java 8 JDK
RUN apt-get update && \  
    apt-get install -y openjdk-8-jdk && \
    apt-get clean
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
ENV JRE_HOME=$JAVA_HOME/jre
ENV PATH=$PATH:$JAVA_HOME/bin

#create the folder to contain bundled Liferay tomcat files, it is an absolute path
#RUN mkdir -p /usr/liferay/docker/appserver/6.2

#Copy the LR tomcat bundle folders/files to container
#COPY liferay-portal-6.2-ce-ga6/ /usr/liferay/docker/appserver/6.2/liferay-portal-6.2-ce-ga6/

#MAKE the whole Tomcat folder as the mounted directory
#VOLUME /usr/liferay/docker/appserver/6.2/liferay-portal-6.2-ce-ga6

# Expose port 8080
#EXPOSE 8080 8443

#WORKDIR /usr/liferay/docker/appserver/6.2/liferay-portal-6.2-ce-ga6/tomcat-7.0.62/bin

#RUN chmod 777 startup.sh

#CMD ["./startup.sh"]
