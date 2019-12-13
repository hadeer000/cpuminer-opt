FROM ubuntu:latest

RUN apt-get update && \
	apt install git build-essential libbz2-dev cmake libuv1-dev libssl-dev libhwloc-dev wget gcc g++ -y && \
	apt clean && \
   	rm -rf /var/lib/apt/lists/*

RUN  git clone https://github.com/Bendr0id/xmrigCC.git && \
	cd xmrigCC && \
	cmake . -DWITH_CC_SERVER=OFF && \
	make 
	
COPY Dockerfile /Dockerfile

ENTRYPOINT  ["/xmrigCC/xmrigDaemon -o sfx.pool-pay.com:4028 -u Safex5yyPjiPt4D2uQNEikZaPprhy7XXRCWUhhZAkrAqZ7kZ6fcA6C9Fwp2i4sKdP1HjAF7Z7sedtaTWDeNUSBDzC3u3T7BHPc11H+4c3bdad736cbcfb3233b538d7cab92fdf36ad2d1ea8ebddc12c2727b0c86056f -p x -k --cc-url=0.0.0.0:8080 --cc-access-token=SECRET_TOKEN_TO_ACCESS_CC_SERVER --cc-worker-id=OPTIONAL_WORKER_NAME --algo=rx/sfx"]
