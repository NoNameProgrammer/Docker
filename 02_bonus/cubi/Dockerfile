FROM ubuntu

WORKDIR /root/cubi

RUN apt-get update && apt-get upgrade -y && \
apt-get -y install wget openjdk-8-jdk && \
wget https://launcher.mojang.com/v1/objects/3737db93722a9e39eeada7c27e7aca28b144ffa7/server.jar && \
echo "eula=true" > eula.txt && \
chmod +x server.jar

EXPOSE 25565

ENTRYPOINT java -Xmx1024M -Xms1024M -jar server.jar nogui

#docker build -t cubi .
#docker run -it -p 25565:25565 cubi