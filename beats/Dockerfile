FROM elastic/filebeat:8.5.3

USER root
RUN mkdir -p /opt/logs
COPY generate_logs.sh /var/opt/logs/
CMD ["bash", "/var/opt/generate_logs.sh"]
