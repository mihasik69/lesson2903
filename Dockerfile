FROM tomcat:9.0.31
RUN apt-get update
RUN apt-get install default-jdk -y
RUN apt-get install git -y
RUN apt-get install maven -y
RUN apt-get install tomcat9 -y
RUN rm -rf /home/sampleTest
RUN mkdir /home/sampleTest
RUN cd /home/sampleTest
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN mvn -f "/boxfuse-sample-java-war-hello/pom.xml" package
RUN cp /boxfuse-sample-java-war-hello/target/hello-1.0.war /var/lib/tomcat9/websapps

EXPOSE 8080
