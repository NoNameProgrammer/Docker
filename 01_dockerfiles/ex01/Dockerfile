FROM debian

EXPOSE 9987/udp 30033 10011

RUN apt-get update && \
apt-get -y install wget bzip2 && \
cd && \
wget https://files.teamspeak-services.com/releases/server/3.12.1/teamspeak3-server_linux_amd64-3.12.1.tar.bz2 && \
tar -xvf teamspeak3-server_linux_amd64-3.12.1.tar.bz2 && \
rm teamspeak*.tar.* && \
cd teamspeak3-server_linux_amd64 && \
touch .ts3server_license_accepted

WORKDIR /root/teamspeak3-server_linux_amd64

ENTRYPOINT sh ts3server_minimal_runscript.sh  

#docker build -t ex01 .
#docker run -it -p 9987:9987/udp -p 30033:30033 -p 10011:10011 ex01