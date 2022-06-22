# MAVEN

# Ayuda a automatizar:
#  La creación
#  La gestión de dependencias: Librerias externas
#  La compilación / empquetado del proyecto
#  Automatización de pruebas 

sudo apt update && sudo apt install maven -y

mvn archetype:generate \
-DarchetypeArtifactId=maven-archetype-webapp \
-DarchetypeVersion=1.4 \
-DgroupId=com.curso \
-DartifactId=proyectoWEB \
-DinteractiveMode=false