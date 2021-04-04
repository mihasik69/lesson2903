FROM ubuntu:20.04
RUN apt-get update
RUN apt-get install default-jdk -y
RUN apt-get install git -y
RUN apt-get install maven -y
RUN apt-get install tomcat9 -y
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git /home
RUN cd /boxfuse-sample-java-war-hello
RUN mvn package
RUN cp ./target/hello-1.0.war /var/lib/tomcat9/websapps
EXPOSE 8080
CMD ["/var/lib/tomcat9"]