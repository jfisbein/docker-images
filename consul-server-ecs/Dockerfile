FROM gliderlabs/consul-server:0.6
COPY start-consul.sh /
RUN chmod +x /start-consul.sh
RUN echo $0
ENTRYPOINT ["/start-consul.sh"]
