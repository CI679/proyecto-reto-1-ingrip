# Metodologías de Desarrollo Software

En este proyecto del primer parcial se realizo una aplicacion relacionada a aprender sobre las distintas metodologias del desarrollo software, aplicando
el uso de bash y de contenedores para empaquetar los distintos archivos.

## Hacer uso de este proyecto

A continuación se mostrara lo necesario para hacer uso de este proyecto para uso propio en tu maquina local.

## Pre-Requisitos

Necesitaras contar con las siguientes aplicaciones descargadas en tu computador.

**- Git**

**- Docker**
  
Antes de instalar git y docker en nuestra computadora, primero nos aseguraremos que nuestro sistema este actualizado,
en la terminal ingresaremos el siguiente código para actualizarlo:

```
sudo apt update
```

Para instalarlas en tu computadora en caso de no tenerlas, ingresaras a la terminal y agregarás los siguientes comandos:

**- Git**
```
sudo apt install git -y # Para instalar Git
git --version # Verificamos que se instaló correctamente
```
En caso de que sea la primera vez instalando Git, es recomendable asociar un correo para tus commits, para configurarlo se ejecuta lo siguiente:
```
git config --global user.name "Tu Nombre"
git config --global user.email "tu@email.com"
```
**- Docker**
Actualizaremos los paquetes e intalaremos las dependencias escribiendo en la terminal lo siguiente:
```
sudo apt update && sudo apt upgrade -y
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
```
Ahora añadiremos el repositorio de Docker (esta opcion varia dependiendo el sistema operativo, este código es para el SO Ubuntu)
```
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```
Instalamos Docker y verificamos que este funcionando:
```
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io -y
```
```
sudo systemctl status docker
```
Para utilizar Docker sin sudo (opcional) escribimos los siguiente:
```
sudo usermod -aG docker $USER #Reemplazar con nombre de usuario
newgrp docker #Reiniciamos
```
```
docker run hello-world # Probamos Docker con un contenedor de prueba
```
Por ultimo despues instalados Git y Docker crearemos un repositorio remoto, crearemos una carpeta en nuestro equipo donde haremos un Git remoto para poder comenzar a trabajar con los archivos
del repositorio de GitHub.
Para ello dentro de nuetra carpeta ejecutaremos el siguiente comando

```
git clone https://github.com/g-lazo/PPP
```
## Instalación

#### Opción 1: Usando Bash Shell directamente

```
chmod +x script.sh # Dar permisos de ejecución
./script.sh -a # Para metodologías ágiles
./script.sh -t # Para metodologías tradicionales
```

#### Opción 2: Usando la imagen de Docker
Para la ejecución mediante la imagen de Docker, ejecutamos el siguiente comando en la terminal para descargar y ejecutar la imagen con todo empaquetado y ejecutara el script.

**- Ejecutar el programa con metodologías ágiles**
```
docker run mbalderrama/metodologias:1.3 -a
```

**- Ejecutar con metodologías tradicionales**
```
docker run mbalderrama/metodologias:1.3 -t
```


### Simulación manual de pruebas de principio a fin:

```
Agregar concepto -> Verificar que aparece en archivo .inf
Buscar concepto -> Verificar salida en pantalla
Eliminar concepto -> Confirmar que ya no aparece en archivo .inf
Leer base -> Verificar contenido desplegado
```

## Deployment

Para desplegar la aplicación se debe ejecutar la imagen de docker(se debe tener previamente instalado), esto permite que se ejecute sin tanta complicación.

## Herramientas utilizadas para la app

* **Bash** – Lenguaje utilizado para desarrollar la aplicación
* **Docker** – Usado para empaquetar y distribuir la app


## Integrantes
**368073 Pablo Gael Torres** 

**367582 Mauricio Antonio Balderrama Chaparro** 

**367903 Gustavo Adolfo Lazo Ramirez** 

**a367760 Ingrid Yuliana Perez Rodriguez** 
