FROM selenium/node-chrome:latest

# Instalar stunnel
USER root
RUN apt-get update && \
    apt-get install -y stunnel

# Agregar certificados y archivo de configuración
COPY stunnel.conf /etc/stunnel/stunnel.conf
COPY certs/ /etc/stunnel/certs/

# Configurar entrypoint para incluir stunnel
ENTRYPOINT ["/bin/bash", "-c", "stunnel /etc/stunnel/stunnel.conf & /opt/bin/entry_point.sh"]
