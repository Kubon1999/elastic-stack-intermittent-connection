FROM docker.elastic.co/beats/filebeat:7.16.2

USER root
RUN mkdir -p /var/opt/logs
COPY generate_logs.sh /var/opt/logs/
RUN chmod +x /var/opt/logs/generate_logs.sh
RUN chmod +x /usr/share/filebeat/filebeat
RUN ls /usr/share/filebeat/ -lah
RUN rm /usr/share/filebeat/filebeat.yml
COPY filebeat.yml /usr/share/filebeat/filebeat.yml
RUN chmod go-w /usr/share/filebeat/filebeat.yml

COPY start.sh /
CMD ["/start.sh"]
