docker build -t tss .
echo "---------------TeamSpeakServer IP: $(docker-machine ip Char)"
docker run -d --rm --name=TeamSpeakServer -p=9987:9987/udp -p=30033:30033 -p=10011:10011 tss
