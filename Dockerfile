FROM openjdk:17-jdk-slim
WORKDIR /app
COPY target/employee-api-1.0.0.jar employee-api.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "employee-api.jar"]
