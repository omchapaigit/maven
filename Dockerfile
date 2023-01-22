FROM tomcat:8.0-alpine
COPY om_project.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh","run"]
