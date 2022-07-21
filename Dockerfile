# syntax=docker/dockerfile:1

# official image base
FROM openjdk:16

# default working directory
WORKDIR /app

# copy some files and dir into working dir
COPY .mvn/ .mvn
COPY mvnw pom.xml ./

# use mvn to install dependencies
RUN ./mvnw dependency:go-offline

# add source code to image
COPY src ./src

# tell Docker what command we want to run when our image is exe inside a container
CMD ["./mvnw", "spring-boot:run"]



