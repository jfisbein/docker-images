FROM gliderlabs/consul-server:0.6.1

COPY ./start-consul.sh /
RUN chmod +x /start-consul.sh

ENTRYPOINT ["/start-consul.sh", "agent", "-server", "-config-dir=/config"]
