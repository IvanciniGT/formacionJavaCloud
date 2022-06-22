Haciamos un webapp ->
    - war
    - ear

Esos archivos son ejecutables dentro de un Serv. Apps. 
    - jar
    
Ese jar se ejecuta con la maquina virtual de java

Vamos a aplicaciones de microservicios -> Springboot
    - jar = Serv apps + WAR app
    
Despliegue del jar... Se va a hacer muchas veces
La gestión del entorno de producción la quiero automatizada

Contenedores: Kubernetes / Gestor de contenedores
Al Kubernetes hay que darle instrucciones de cómo instalar aquello y cómo operarlo

ESTO ESTA AUTOMATIZADO: 

Desarrollo   ->    JAR  -->  Imagen       --> CHART HELM    --> Kubernetes. --> ISTIO --> Monitorizar
 JAVA             Docker     Contenedor                         |                     --> Tecnicas de despliegue
    Springboot               Descriptores                       |                     --> Operación
 MAVEN                       Kubernetes                         |               Configurarlo
 GIT.                                                           |                   Sistemas 
                                                                |                   App         DESARROLLO ???
                                                                -------------------------
                        |                     Parametrizarlo
                        |                     despliegue por                DESARROLLO
                        |                        - entornos                 DEVOPS (sistemas)
                        |                        - cliente
                        |     Instalación
                        |     Balanceador de carga - Service ClusterIP
                        |     Proxy reverso        - Ingress
                        |     Configurar el escalado
                        |     Politicas de comunicaciones de mi app
                        |     Recursos que requiere mi app
                        |---------------------------------------------------------------
                Dockerfile
                Debe ser parametrizable
                                                            DESARROLLO
 Quien ha configurado el serv de apps?
 Usuarios/Contraseñas -> BBDD
 Tamaño pool
 -----------------------------------------------------------------------------
 Quier conseguir poner la puesta en producción en manos del desarrollador.
 
 
 
 Service Mess       >   Follón Lio
    Service Mesh    >   Malla de servicios . ISTIO (Linkerd)
    
------------
ElasticSearch: JAVA
10 nodos físicos
3 procesos master
6 nodos de datos
2 procesos coordinacion - escalables      *****
2 procesos o más de ingresta - escalables *****.   3 servicios
Kibana                                    *****
----------------------------

ISTIO = Man in the middle, pero mio

Toma control total de todas las comunicaciones del cluster:
- Puedo monitorizar todas y cada na de las comunicaciones... 
    por lo que averiguar si una falla es directo.-> KIALI
- Puedo securizar todas las comunicaciones
 
----------------------------

POD: Conjunto de contenedores que:
- Se ejecutan en el mismo host
- ** Comparten configuracion de red <- IP. Entre ellos se hablan mediante localhost**
- Escalan juntos
- Pueden compartir volumenes de almacenamiento no persistente

Cluster Kubernetes:

Maquina 1
    POD1
        Contenedor Servicio 1
            ^^^^^ vvvvv localhost
        Man In The Middle 1 - Proxy: Envoy
        IPTables se hace que todas las comunicaciones entrantes y salientes al pod vayan a través del envoy
Maquina 2
    POD2
        Contenedor Servicio 2
            ^^^^^. vvvvvv
        Man In The Middle 2 - Proxy: Envoy
Maquina 3
    POD3
        Contenedor Servicio 3                   OUT
        Man In The Middle 3 - Proxy: Envoy
    POD4
        Contenedor Servicio 2 NUEVO
        Man In The Middle 4 - Proxy: Envoy
    ISTIO


                            COLA: B, C, D, E, F
Cliente >>>>>>>  Servicio 1 [ISTIO] >>>>>>> [ISTIO] Servicio 3 (out)
          500                       A - timeout
                                    
Y ahora esto en carga

No tengo perdida de servicio, un retraso tal vez... pero no perdida 


----


Me voy a instalar JAVA en mi ordenador:

JDK     JVM (java)  javac
JRE     JVM (java)

En un entorno de producción, que quiero instalar?
JDK

Servlet.  .java ---> .class ---> distribuirlo --------->
          .jsp  -------> Se distribuye tal cual.  ----->    WAR
          .jfc  -------> Se distribuye tal cual.  ----->
          
El servidor de apps será quien los -> Convierta en servlets y los compile -> .class


GOALS DE MAVEN:
compiles el codigo java         compile
compiles pruebas                test-compile
ejecutes pruebas                test
empaquetes                      package
                                install
                                
                                springboot-> Requete empaquetado -> jar ejecutable (embebido tomcat)
                                sonar:sonar
                                
tomcat contenedor


Kubernetes
    Maquina 1
        containerd | crio
    Maquina 2
        containerd | crio
    Maquina 3
        containerd | crio
