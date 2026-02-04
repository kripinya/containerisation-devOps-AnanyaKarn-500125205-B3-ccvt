FROM ubuntu:22.04

RUN apt update
RUN apt install -y openjdk-17-jdk

WORKDIR /home/app

COPY Hello.java .

RUN javac Hello.java
ENTRYPOINT ["sh", "-c", "echo Ananya"]
CMD ["java", 'Hello']