FROM alpine:latest

#Se instala Bash porque es necesario para ejecutar el script
RUN apk add --no-cache bash

#/app se establece como el directorio donde trabajeremos
WORKDIR /app

COPY . .
RUN chmod +x script.sh

#Configuracion del comando de inicio
ENTRYPOINT ["/bin/bash", "-c", "./script.sh \"$@\"", "--"]