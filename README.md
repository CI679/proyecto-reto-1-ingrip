# Metodologías de Desarrollo Software

En este proyecto del primer parcial se realizo una aplicacion relacionada a aprender sobre las distintas metodologias del desarrollo software, aplicando
el uso de bash y de contenedores para empaquetar los distintos archivos.

## Hacer uso de este proyecto

A continuación se mostrara lo necesario para hacer uso de este proyecto para uso propio en tu maquina local.

### Prerrequisitos

Necesitaras contener con las siguientes aplicaciones descargadas en tu computador.
- Git
- Docker
Para tenerlas instaladas en tu computadora ingresaras a tu terminal y agregaras los siguientes comandos:

//PENDIENTE

### Installing

#### Opción 1: Usando Bash Shell directamente

```
chmod +x script.sh # Dar permisos de ejecución
./script.sh -a # Para metodologías ágiles
./script.sh -t # Para metodologías tradicionales
```

#### Opción 2: Usando Docker

```
Construir la imagen
docker build -t metodologias .
Ejecutar el contenedor
docker run -it metodologias -a # Puede ser -a o -t según lo que se desee usar
Una vez ejecutado, podrás navegar por las metodologías disponibles y utilizar el submenú para agregar, buscar, eliminar o leer información.
```

### Break down into end to end tests

Simulación manual de pruebas de principio a fin:

```
Agregar concepto -> Verificar que aparece en archivo .inf
Buscar concepto -> Verificar salida en pantalla
Eliminar concepto -> Confirmar que ya no aparece en archivo .inf
Leer base -> Verificar contenido desplegado
```

## Deployment

Para desplegar la aplicación se debe ejecutar la imagen de docker(se debe tener previamente instalado), esto permite que se ejecute sin tanta complicación.

## Built With

* **Bash** – Lenguaje utilizado para desarrollar la aplicación
* **Docker** – Usado para empaquetar y distribuir la app

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags). 

## Authors
**368073 Pablo Gael Torres** 
**367582 Mauricio Antonio Balderrama Chaparro** 
**367903 Gustavo Adolfo Lazo Ramirez** 
**a367760.- Ingrid Yuliana Perez Rodriguez** 
See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Hat tip to anyone whose code was used
* Inspiration
* etc