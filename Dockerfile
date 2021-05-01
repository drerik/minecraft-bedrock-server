FROM ubuntu:20.04

WORKDIR /srv
RUN apt update && apt install -y wget unzip
RUN wget https://minecraft.azureedge.net/bin-linux/bedrock-server-1.16.221.01.zip && unzip bedrock-server-1.16.221.01.zip && chmod +x ./bedrock_server

EXPOSE 19132 43432

CMD LD_LIBRARY_PATH=. ./bedrock_server
