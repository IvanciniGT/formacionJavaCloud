# Dev ---> ops

Automatización
    Integración continua
    Entrega continua
    Despliegue continuo
    
---

# Agile

Metodología de organización de proyectos de desarrollo de software.
Antes usábamos metodologías en cascada.. Ruina !!!

Trabajan (las entregas del producto al cliente) se hacen de forma iterativa, fases:
    Entrega 1   20 dias     100% funcional      5% de la funcionalidad
    Entrega 2   20 días     100% funcional      15% de la funcionalidad
    Entrega 3   20 dias     100% funcional      25% de la funcionalidad
    Entrega N   20 dias     100% funcional      100% de la funcionalidad

Pruebas / Instalaciones
    En una metodología en cascada, cuantas veces pruebo/Instalo? En teoria 1
    En una metodología ágil      , cuantas veces pruebo/Instalo? En teoria un huevo

Solo hay una forma de rentabilizar esto: AUTOMATIZAR

# Cloud

Conjunto de servicios (relacionados con el mundo IT) que se ofrecen a través de 
internet por parte de una empresa, de forma AUTOMATIZADA (sin intervención humana) 

Servicios:
    - IaaS    - PaaS    - SaaS

Provisionar recursos (infraestructura) de una forma ágil, flexible, barata (pago por uso).

# Entornos de producción

- Alta disponibilidad: Intentar garantizar que la app tendrá un determinado tiempo de servicio... 
                       y que con una probabilidad grande no perderé datos.
                        
        App 90% - 36 dias off al año... Pa una peluquería                           | €
        App 99% - 3,6 días al año off                                               | €€
        App 99,9% - 8 horas al año la app que puesde estar off                      | €€€€€
        App 99,99% - Minutos al año... contando mantenimientos y actualizaciones.   | €€€€€€€€€€€€€€
                                                                                    V

- Escalabilidad: Capacidad de ajustar los recursos que requiere una app en cada momento

    # Modelo 1 de app: Cualquier app departamental. No necesito escalabilidad
    
    Dia 1:   100 usuarios
    Dia 100:  96 usuarios
    Dia 300: 102 usuarios
    Dia 500: 106 usuarios


    # Modelo 2 de app: Una app que vayan usando más clientes
    
    Dia 1:   100 usuarios
    Dia 100: 1000 usuarios -> desarrollo, para que suban el pool?
    Dia 300: 5000 usuarios
    Dia 500: 10000 usuarios


    # Modelo 3 de app: INTERNET. Cambia por minutos
    
    Dia n:       100 usuarios
    Dia n+1:  100000 usuarios
    Dia n+2:    5000 usuarios
    Dia n+3: 2000000 usuarios


Montamos un Cluster: Un grupo de algo servidores/procesos que ofrecen todos el mismo servicio
    Activo - Pasivo
        Uno on y otro off. Si el primero se jode, entra el segundo
    Activo - Activo
        Todos están en marcha ofreciendo servicio
        
Maquina 1           CPU
    Serv. app       50%     \
                             \
Maquina 2                     \        Balanceador de Carga (IP)
    Serv. app       55%     ---
                              /
Maquina 3                    /
    Serv. app   


------------------------------------------------------------------------------------

# JAVA

Lenguaje de programación
- Paradigma: Orientado a objetos
- Interpretado y compilado, a la vez
    - Compilarlo -> byte-code
    - Interpetación del byte-code... un interprete: "Maquina virtual" de Java
- Como hay interpretes para muchos SO distintos y arquitecturas de microprocesador: Multiplataforma
 
----------------------------------------------------------------------------------------

# Tipos de software

Firmware                    NO      |
Sistema operativo           NO       >      C, C++
Driver                      NO      |
Aplicaciones                Un proceso que corre en primer plano, de forma indefinida en el tiempo
                            y pensado para interactuar con seres humanos. Word, Navegador de internet
                            TOAD, sqlplus.
Demonio                     Un proceso que corre en segundo plano, de forma indefinida en el tiempo.
    Servicio                    Pensado para interactuar con otros programas (aplicaciones, otros servicios/demonios)
Scripts                     Un proceso que corre haciendo una secuencia de tareas y acaba, pensado para interactuar con nadie.
                            Instalador
Comandos                    Un programa que hace una tarea concreta, se arranca, la ahace y acaba.

# Usos de JAVA 
    
    App web                         
        Frontend - Navegador        JAVA ---> JavaScript + NodeJS ("máquina virtual de JS")
                                        Aqui JS esta fuerte
        Backend  - Servidor         JAVA + JS (ECMA script)
                                        Aqui JAVA está fuerte... a ver cuanto dura... creemos que mucho
                                        En JAVA hay una cantidad de frameworks muy probados
    Desarrollo apps nativas android
    

Java 2 Enterprise Edition    J2EE
Java Enterprise Edition      JEE   -> Dono a una función y que lo mantengan
Jakarta Enterprise Edition   JEE

# Jakarta Enterprise Edition

Framework: Librerias + Metodologia de uso de esas librerias.
Subestandares:
    - SQL
    - Mensajería
    - ...
    - Comunicaciones Web
        Peticiones http : Request / Response
        Servlet
        JSP
        JFC


# Sobre oracle.... :(

Oracle Database.
    Mysql ---> MariaDB
    Hudson --> Jenkins
    OpenOffice ---> LibreOffice
    Java (Sun microsystem) ---> Hardware ( arquitectura: Sparc + Solaris UNIX®)

Google -> Android (Sistema Operativo más usado del mundo)

# Web

Un servicio que se ofrece a través de Internet, como tantos otros (Email, VoIP, IPTV)

Web: Tim Berners Lee
    Formato de archivos que permita a los seres humanos compartir información   HTML
    Protocolo por el que mandar esos archivos                                   HTTP

Primero años: Sitios web - Repletos de páginas WEB

Hoy en día TODO SON aplicaciones web.
    Una app web, es un software que se ejecuta en un servidor y que es capaz de generar páginas web.

## Servidores web

Apache httpd (serv web + proxy reverso)
Nginx (proxy reverso+ serv web)

Atienden peticiones por http(s) y mandan una repuesta (HTML)

Navegador URL:      protocolo://dominio(servidor):puerto/contexto?parametros
                    http://miservidor/
                    
Definir un virtualhost:
    miservidor:80          /    ->   /var/www
    
# Servidores de aplicaciones

Una versión mejorada de los servidores web, ya que además de obtener documentos estáticos de una carpeta
Nos permiten comunicar con programas que devuelvan contenido por http

JEE: Servidores de aplicaciones |API| Programas
                                        servlet
                                        jsp
                                        jfc

Hace falta acceder a BBDD, no se qué haré con la BBDD. Dependerá de la app que monte.
La gestión de esas conexiones a la BBDD -> Delegarla al servidor de apps.
Podría hacer yo que el programa se encargase  de las conexiones a la BBDD ?? SI
Me interesa? NUNCA JAMAS

Para conectar con una BBDD... que necesito? 
- servidor de BBDD
- puerto
- usuarios
- contraseña
- nombre de la BBDD
- driver
¿Cual de estos datos debe ser gestionado por el quipo de desarrollo? NINGUNO. SEGURIDAD

### Problema adicional con las BBDD

Abrir una conexión a una BBDD

Java... que recursos HW necesito? Ninguno
A nivel de la BBDD, que impacto tiene... que recursos necesito?  
Es un proceso nuevo a nivel de SO que hay que abrir en el servidor, 
que ocupará un huevo y medio de memoria RAM

1- Abro una conexion
2- Cargo 1000 datos
3- Consulto la tabla. veo los datos que acabo de meter? SI
4- Hago commit (Confirmo los cambios)
--
si en paralelo alguien pregunta por la tabla, ve los datos? NO

Pool de conexiones a BBDD. No voy a hacer trabajo que ya esté hecho. Ni que no me competa
Esto es un dato cambiante.

Tiene idea el desarrollador de cuantas conexiones son necesarias? NPI
Y qué sabe el desarrollador del uso que va a tener la app.-.. podrá tener sus estimaciones.
En base a pruebas de carga que nunca ha realizado. JMETER, loadrunner

Solo hay una fuente de verdad de los datos: MONITORIZACION a futuro


Weblogic < Middleware
Tomcat - sprintboot

---

LDAP

----

App web: Mercadona, Rellenar los datos de una transferencia bancaria (3 pasos)

servidor 1 CATAPLOF???
    app1.   RAM     <<< Aceitunas - Sesion
    
servidor 2
    app1                    Balanceador de carga       <      Cliente (cookie: expiración 30 minutos)
                                    StickySessions
servidor 3. <<<<<<
    app1.           <<< Aceitunas

---
Para que usa un software la memoria RAM?
- Cache
- Almacenamiento de datos no persistente / datos de trabajo

JEE
Sesion de un usuario? Una zona en la memoria RAM donde los usuarios conectados a
la app van dejando información no persistente

La session se controla mediante una cookie
HTTPSession
---

REST            <<<<<<<<<<<
Stateless

Statefull


Los campos que has rellenado en los formularios de busqueda

Middleware <<< Tiende a desaparecer <<<< Desarrollo
    Weblogic            
    Websphere -> Liberty

Contenedor < App. Con serv de apps embebido Configuración
Cuanta RAM, Cuanta CPU para atender a cuantas peticiones > Monitorizacion
2               1
3.5   (1gb)     2.  x 10 copias 

Siempre haré escalado horizontal

Conf bbdd... desarrollo Usuario / Contraseña 
ConfigMap/Secret < Produccion Basura

--- 
Aplicaciones monoliticas

Arquitecturas de microservicios


----
Expedientes -  2M - 10000 expedientes abiertos

Usuario app ? expediente? cache(RAM) -> actualización -> BBDD

A lo mejor esos 10000 -> 2Gbs

En cada servidor de apps, tengo 2 Gbs de cache

Si configuro entornos con 3 gbs, significa que realmente solo tengo 1 Gb para datos


5 copias de la app: 15 Gbs... Usables, sin cache: 5 Gbs
3 copias de la app: 15 Gbs... Usables             9 Gbs

# Servidores de aplicaciones

Clase web: Tomcat
    Servidor web
        Hablar con programas (JAVA, JEE)
    Gestionar conexiones a BBDD
Clase empresarial:
    Gestionar conexiones a LDAP
    Gestionar un sistema de mensajería
    Persistencia/Replicación de sesiones

# SOA: Arquitectura orienta a servicios
----------------------------------------
SOAP, UDDI, WSDL

Abandonar el concepto de aplicación monolitica.
    Una aplciación era una unidad de codigo (enorme) que realizaba una serie de funcionalidades
    
Problemas:
    Cada vez que hay un cambio (mejora, arreglo) necesitamos redesplegar TODO
    Ese cambio lo debo hacer a nivel global, en toda la aplicación.
        Nivel de pruebas
    Todo en un único lenguaje de programación
    Escalado:
        Yo no quiero a lo mejor escalar el formulario de entrada
        Si quiero escalar el formulario de busqueda
    Todo está fuertemente acoplado
    
---
Expedientes
 Datos a gestionar en v1
Formularios de busqueda que operaban sobre esos datos v1
Formularios de entrada de datos del expediente v1
-----

# Aplicación -> Sistema

sistema como el conjunto de programas independientes entre si que me ofrecen una funcionalidad

--- 
Aplicaciones banco

Para que una persona consulte los billetes que tiene en la cuenta bancaria.

- Aplicacion web, para que la gente entre desde su navegador JS
    - Programa que valida al usuario
        - Programa de los billetes
- Aplicación en los cajero C++, C#
    - Programa que valida al usuario
        - Programa de los billetes
- Aplciación para el movil Kotlin (lenguaje de programación... sintaxis alternativa a JAVA)
                           (Scala)
    - Programa que valida al usuario
        - Programa de los billetes
- Bizum cambiar al autenticacion_v2
    - Programa que valida al usuario
        - Programa de los billetes
- Sistema de voz interactivo: Telefono          
    - Programa que valida al usuario
        - Programa de los billetes
- Empleado en oficina                   VB
    - Programa que valida al empleado del banco
        - Programa de los billetes


Programa que me permita consultar en una BBDD los billetes de un usuario
    DNI
Programa para validar los datos de un usuario
    DNI + PIN
    DNI < Si la peticion se hace desde un empleado en oficina
    TARJETA + FECHA + CCV + PIN    
    email + telefono
----
    v1
    DNI
    Requiere autenticacion: True
    Datos accesorios: PIN
----
    v2
    tipo de autenticacion: DNI | Tarjeta | email
    Datos accesorios
    
El problema aquí es comunicarlos... Definir un API de comunicacion
    Protocolo de comunicación SOAP < XML
    Protolo REST                   < JSON
        Concepto a la hora de montar esas APIs: RESTful
            http://servidor/cuentas/93856738/movimientos/1627
            Montar aplicaciones stateless

Arquitectura basada en MICROSERVICIOS:
    Servicios muy pequeños en funcionalidad
    Stateless
    
Voy a acabar con cientos de servicios, en distintas versiones, que tengo que controlar entre si
    Gestores de APIs
    
PROBLEMA : Seguridad / Securización

          INTERNET
Cliente - SECURIZAR -> ServApps (app gigante) - SECURIZAR -> BBDD
contraseña              certificado
    TLS
    http + TLS -> HTTPS:
    - frustrar 2 tipos de ataques:
        - man in the middle             < Encriptando la información que viaja
                                            + Clave simetrica  (clave única)
                                            + Clave asimétrica (clave publica + clave privada)
        - suplantación de identidad     < Certificados (Firma) : DNI + Carnet de Conducir + Pasaporte
                                                                 Carnet de la biblioteca del barrio
                                            Entidad certificadora
          TLS1
Cliente - HTTPS -> Serv Apps (miniapp) 
                    HTTPS (TLS 2)-> Servicio1 
                                HTTPS -> Servicio2 
                                    HTTPS -> servicio3  FALLA!
                                        HTTPS-> servicio4 
                                            TLS -> BBDD
                                            
800 certificados + 800 claves publicas + privadas, que hay que renovar cada mes
Y configurar aquello en los 800 tomcats/liberty/weblogic/wildfly

---
# Contenedorización

## Contenedor

**Entorno aislado de ejecución de procesos dentro de un SO Linux**

Entorno aislado:
    Su propia configuración de red
    Su propio sistema de archivos
    Sus propias variables de entorno
    Limitación de acceso a recursos HW de la máquina
Los contenedores se diferencias grandemente de las maquinas virtuales en que no tienen un SO

Me resuelven muchos de los problemas que tengo al instalar y operar apps en un entorno de producción:

- Ejecución del software
        Ordenador > SO Linux > Gestor de contenedores
            C1 >  App1
            C2 >  App2
            C3 >  App3+ App4

- Distribución / Instalación de software

    Quiero instalar mysql en mi ordenador. Que hago?
        1- Descargo el instalador
        2- Instalo
        3- Configuro
        
        Esto se instalará en una carpeta de mi computadora... 
        si la comprimo en un tar y os la mando por email, y os la descompriomis, os funciona
        ^^^ Esto es una imagen de contenedor
        
        
    Imagen de contenedor: Este zip (tar) contiene una app ya instalada
        y todo lo necesario para que el programa funcione, configuraciones, dependencias

- Operación de software : ESTANDARIZACION
    Hay que arrancar un software
    Hay que para un software
    Hay que reiniciar un software
    Hay que mirar los logs



Gestores de contenedores: Docker, Podman, CRIO, Containerd

Gestores de gestores de contenedores: Kubernetes, Openshift, Vanilla(K3S)



---
# Contenedores y JAVA (JEE)

App java: Coleccion de ficheros .JAVA + otros (configuraciones, HTML, Imagenes, css)
                Compilación \
                Empaquetado / Maven + Gradle, SBT
                
                    -> jar                  |
                    -------                 |   Un zip
                    -> war \                |
                    -> ear / JEE            |
                    
                EAR, WAR: JEE
                    Son archivos que para su funcionamiento deben ser desplegados en
                    un servidor de apps JAVA
                
                JAR: 
                    - Una libreria (Un driver de BBDD, un parser de YAML)
                    - Una app ejecutable dentro de una JVM
                    
                De hecho, que es un servidor de apps Java?
                    Tomcat, Weblogic, JBoss -> jar
                    
El proceso que corre dentro de un SO, el que controla el SO, es la JVM
Al trabajar con contenedor y JAVA:
Dentro de una imagen de contenedor debo incluir:     <<< DESARROLLO
    JAVA
    JAR del servidor de apps de turno
    WAR/EAR de mi app


Frameworks, que aceleran el desarrollo, spring
springboot: App web java -> war -> jar, que ademas lleva un tomcat dentro 
                
                
