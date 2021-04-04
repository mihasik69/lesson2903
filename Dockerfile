FROM tomcat:9.0.31
RUN apt-get update
RUN apt-get install default-jdk -y
RUN apt-get install git -y
RUN apt-get install maven -y
RUN wget https://downloads.apache.org/tomcat/tomcat-9/v9.0.44/bin/apache-tomcat-9.0.44.tar.gz  -O /tmp/tomcat.tar.gz
RUN cd /tmp && tar xvfz tomcat.tar.gz
RUN cp -Rv /tmp/apache-tomcat-9.0.44/* /usr/local/tomcat/
WORKDIR /home/sampleTest
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN mvn -f "./boxfuse-sample-java-war-hello/pom.xml" package
RUN cp ./boxfuse-sample-java-war-hello/target/hello-1.0.war /usr/local/tomcat/webapps/hello-1.0.war
WORKDIR /usr/local/tomcat
EXPOSE 8080
