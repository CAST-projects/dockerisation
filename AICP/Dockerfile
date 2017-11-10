FROM tomcat:8.5-alpine
MAINTAINER Kevin Furet k.furet@castsoftware.com

COPY ./CAST-AICP /usr/local/tomcat/webapps/CAST-AICP

COPY web.xml /usr/local/tomcat/webapps/CAST-AICP/WEB-INF/
RUN chmod +x /usr/local/tomcat/webapps/CAST-AICP/WEB-INF/web.xml

COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 8080
CMD ["catalina.sh", "run"]
