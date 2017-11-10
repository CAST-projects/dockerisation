FROM tomcat:8.5-alpine
MAINTAINER Kevin Furet k.furet@castsoftware.com

COPY ./CAST-AED /usr/local/tomcat/webapps/CAST-AED

COPY context.xml /usr/local/tomcat/webapps/CAST-AED/META-INF/
RUN chmod +x /usr/local/tomcat/webapps/CAST-AED/META-INF/context.xml

COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 8080
CMD ["catalina.sh", "run"]
