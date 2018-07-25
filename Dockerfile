FROM anapsix/alpine-java
MAINTAINER Sergey_Konotop
COPY ./target/demo-0.0.1-SNAPSHOT.jar /home/demo-0.0.1-SNAPSHOT.jar
EXPOSE 8080
CMD ["java","-jar","/home/demo-0.0.1-SNAPSHOT.jar"]
