FROM anapsix/alpine-java
MAINTAINER Sergey_Konotop
#ADD http://172.28.128.8:8081/artifactory/webapp/#/artifacts/browse/simple/General/test_folder/demo-0.0.1-SNAPSHOT.jar /home/demo-0.0.1-SNAPSHOT.jar
COPY ./target/demo-0.0.1-SNAPSHOT.jar /home/demo-0.0.1-SNAPSHOT.jar
EXPOSE 8080
CMD ["java","-jar","/home/demo-0.0.1-SNAPSHOT.jar"]
