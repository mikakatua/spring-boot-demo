FROM ubuntu:18.04

COPY setup .
RUN chmod +x install.sh && ./install.sh

WORKDIR /azp

COPY ./start.sh .
RUN chmod +x start.sh

CMD ["./start.sh"]
