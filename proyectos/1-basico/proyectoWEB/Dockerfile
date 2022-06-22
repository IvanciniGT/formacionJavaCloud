FROM bitnami/git AS clonador
RUN git clone https://github.com/IvanciniGT/formacionJavaCloud.git /tmp/proyecto


FROM maven:3.8.6-jdk-11 AS empaquetador
# Esta carpeta es dentro del empaquetador
COPY --from=clonador /tmp/proyecto /miproyecto
RUN cd /miproyecto/proyectos/1-basico/proyectoWEB && mvn package


FROM docker.io/bitnami/tomcat:10
COPY --from=empaquetador /miproyecto/proyectos/1-basico/proyectoWEB/target/proyectoWEB.war /opt/bitnami/tomcat/webapps