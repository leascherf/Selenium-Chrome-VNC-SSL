Proyecto Selenium con VNC y SSL
Este proyecto configura un entorno de Selenium Grid con soporte para VNC sobre SSL utilizando Docker. La configuración incluye imágenes personalizadas para los nodos de Chrome, Firefox y Edge.

Estructura del Proyecto
La estructura del proyecto es la siguiente:

/project-root
|-- Dockerfile-edge-ssl
|-- stunnel.conf
|-- certs/
|   |-- your_cert.pem
|   |-- your_key.pem
|-- docker-compose.yml
Dockerfile-edge-ssl: Dockerfile personalizado para el nodo de Edge con soporte SSL para VNC.
stunnel.conf: Archivo de configuración para stunnel.
certs/: Carpeta que contiene los certificados SSL necesarios (your_cert.pem y your_key.pem).
docker-compose.yml: Archivo de configuración de Docker Compose para levantar los servicios.
Configuración de Certificados SSL
Coloca tus certificados en la carpeta certs/:

your_cert.pem - Certificado SSL.
your_key.pem - Clave privada del certificado SSL.
Archivo de configuración de stunnel (stunnel.conf):
Configura este archivo según tus necesidades de SSL. Un ejemplo de configuración es:

[vnc]
accept = 5901
connect = localhost:5900
cert = /etc/stunnel/certs/your_cert.pem
key = /etc/stunnel/certs/your_key.pem
Construcción y Ejecución
Construir la imagen de Docker:

docker-compose build edge-ssl
Levantar los contenedores:

docker-compose up -d
Servicios Disponibles
Selenium Hub: Disponible en http://localhost:4444.
Nodo Edge con VNC sobre SSL: Disponible en https://localhost:5901.
Para otros nodos (Chrome, Firefox), deberás seguir un proceso similar para configurar el soporte SSL para VNC si es necesario.

Contribuciones
Si deseas contribuir a este proyecto, por favor revisa las pautas de contribución en CONTRIBUTING.md.

Licencia
Este proyecto está licenciado bajo la MIT License.

Este README.md proporciona una visión general clara de la estructura del proyecto, cómo configurar y ejecutar los contenedores, y cómo manejar los certificados SSL. Puedes adaptar la información según los requisitos específicos de tu proyecto.