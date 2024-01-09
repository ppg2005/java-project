FROM openjdk:11-jdk-slim

WORKDIR /app

COPY src/Helloworld.java /app
RUN javac Helloworld.java

CMD ["java", "Helloworld"]
