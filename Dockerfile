# Usar una imagen base con VNC y X11
FROM selenium/node-chrome:latest

# Instalar stunnel y x11vnc
RUN apt-get update && \
    apt-get install -y stunnel x11vnc

# Configurar el punto de entrada
ENTRYPOINT ["/bin/bash", "-c", "stunnel /etc/stunnel/stunnel.conf & x11vnc -forever -shared -rfbport 5900 -display :99"]

# Exponer puertos VNC y SSL
EXPOSE 5900 5901
