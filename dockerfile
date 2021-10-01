FROM centos

MAINTAINER ankit.maurya@jktech.com

RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat
RUN curl -O https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.53/bin/apache-tomcat-9.0.53.tar.gz
RUN tar -xvzf apache*.tar.gz
RUN mv apache-tomcat-9.0.53/* /opt/tomcat/.
#ADD ./jdk-8u221-linux-x64.tar.gz .
COPY ./jdk-8u221-linux-x64.tar.gz /opt/.
RUN yum install -y tar*
#RUN tar -xvzf jdk-8u221*.tar.gz 
RUN rm -rf /opt/tomcat/jdk-8u221-linux-x64.tar.gz && rm -rf /opt/tomcat/jdk8
RUN cd /opt/ && tar xvf jdk-8u221-linux-x64.tar.gz
#RUN tar xvf jdk-8u221-linux-x64.tar.gz
RUN mv /opt/jdk1.8.0_221 /opt/jdk8
RUN alternatives --install /usr/bin/java java /opt/jdk8/bin/java 100
RUN alternatives --install /usr/bin/jar jar /opt/jdk8/bin/jar 100
RUN alternatives --install /usr/bin/javac javac /opt/jdk8/bin/javac 100
RUN alternatives --set jar /opt/jdk8/bin/jar
RUN alternatives --set javac /opt/jdk8/bin/javac
#RUN which java
#RUN alternatives --config java -1

#RUN javac -version

#WORKDIR /opt/tomcat/webapps
#COPY ./itimer.war /opt/tomcat/webapps
#RUN curl -O -L https://github.com/AKSarav/SampleWebApp/raw/master/dist/SampleWebApp.war

EXPOSE 8080 443 80

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
