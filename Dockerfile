FROM openjdk:17.0.2-jdk

WORKDIR /app

COPY target/sprbootdemo-0.0.1-SNAPSHOT.jar.original /app/MainClass.jar

ENTRYPOINT ["java","-jar","/app/MainClass.jar"]
