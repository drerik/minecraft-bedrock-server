FROM ubuntu:20.04

ENV BEDROCK_SERVER_ACHIVE_FILE=/srv/bedrock-server-1.16.221.01.zip
ENV BEDROCK_SERVER_PATH=/srv
WORKDIR $BEDROCK_SERVER_PATH
RUN apt update && apt install -y wget unzip
RUN wget https://minecraft.azureedge.net/bin-linux/bedrock-server-1.16.221.01.zip && unzip bedrock-server-1.16.221.01.zip && chmod +x ./bedrock_server

COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 19132/udp 43432

CMD /start.sh
