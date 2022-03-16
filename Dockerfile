FROM ubuntu
MAINTAINER  Vanessa Ayala
RUN apt-get update && \
				apt-get install -y --no-install-recommends vsftpd db-util && \
				apt-get clean

RUN apt-get install vsftpd -y
RUN apt-get install ftp -y
ENV PUBLICHOST: 192.168.100.4
ENV FTP_USER_NAME: vane
ENV FTP_USER_PASS: vane
ENV FTP_USER_HOME: /home/vane
COPY vsftpd.conf /etc/vsftpd/
RUN mkdir -p /home/vane
RUN chown -R 777 /home/vane
RUN service vsftpd start
RUN chmod 555 /var/ 
EXPOSE 20 21
VOLUME ["/home/vane"]
VOLUME ["/var/log/vsftpd"]
CMD /usr/sbin/vsftpd