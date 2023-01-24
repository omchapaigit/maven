FROM tomcat:8.0-alpine
COPY 1.0.1.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh","run"]
