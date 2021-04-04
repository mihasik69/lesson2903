FROM ubuntu:20.04
RUN apt-get update
RUN apt-get install default-jdk -y
RUN apt-get install git -y
RUN apt-get install maven -y
RUN apt-get install tomcat9 -y
RUN rm -rf /home/sampleTest
RUN mkdir /home/sampleTest
RUN cd /home/sampleTest
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
WORKDIR /home/sampleTest/boxfuse-sample-java-war-hello
RUN mvn -f "/pom.xml" package
RUN cp ./target/hello-1.0.war /var/lib/tomcat9/websapps
EXPOSE 8080
CMD ["bin/bash"]