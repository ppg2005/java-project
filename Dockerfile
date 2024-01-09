# Use the official openjdk image as the base image
FROM openjdk:11-jdk-slim
# Set the working directory in the Docker container
WORKDIR /app

# Copy the HelloWorld.java file into the Docker container
COPY  src/ /app/src/Helloworld.java .
# Compile the HelloWorld.java file
RUN javac /app/src/HelloWorld.java

# Specify the command to run when the Docker container starts

CMD ["java",  "-cp", "/app/src", "Helloworld.java"]
