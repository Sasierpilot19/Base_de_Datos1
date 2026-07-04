# Contenedores de Sistemas Gestores de Base de Datos

## Imagenes 

> Comandos para cada imagen 

- Comando para descargar imagen de postgres 
![Imagen postgres](../img/Docker-Embleme.jpg)
```docker
docker pull postgres:14.22-trixie
```

- Descargar imagen de tutorial de docker

```docker
docker pull docker/getting-started
```
## Creacion de contenedores 

```docker
docker run -d -p 80:80 docker/getting-started
docker run -d -p 80:8090 d79336f4812b
```
Donde: 
- -d detach (bakground)
- -p puerto (el primer numero de puerto no se cambia, el segundo si)

## Contenedor de tutorial de Docker
```docker
docker run -d -p 80:80 docker/getting-started:latest
```

### Contenedor de MariaDB sin volumen

```docker
docker run -d --name server-MariadbG1 -p 3343:3306 -e MARIADB_ROOT_PASSWORD=123456 e0236
```
### Contenedor de MariaDB con volumen

```
docker volumen create v-mariadbG1
docker run -d --name server-MariadbG1 -p 3343:3306 -e MARIADB_ROOT_PASSWORD=123456 -v v-mariadbG1:/var/lib/mysql e0236
```

### Contenedor de postgres con volumen

```
docker volumen create v-postgresG1
docker run -d --name server-PostgresbG1 -p 5455:5432 \
-e POSTGRES_PASSWORD=123456 -v v-postgresG1:/var/lib/postgresql/data bbb885
```

### Contenedor de SQLserver con volumen
```
docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=<P@ssw0rd>" \
-p 1450:1433 --name SQLserverG1 -d -v \
v-sqlserverG1:/var/opt/mssql/data e07b9
```

## Comandos de docker

| Comando   |Descripcion|
|-----------|-----------|
|           |           |
| **docker --version**    | _Muestra la version del docker_ |
| **docker pull nombre_imagen**   | _Descargar un imagen de Docker hub_ [Docker Hub](https://hub.docker.com/)|
| **docker images**   | _Muestra todas las imagenes_|
| **docker run**|_Crear un contenedor_|
| **docker ps**|_Visualiza los contenedores que estan en ejecucion_|
| **docker container ls**|_Visualiza los contenedores que estan en ejecucion_|
| **docker ps -a**|_Visualiza todos los contenedores aunque no esten en ejecucion_|
| **docker container ls -a**|_Visualiza los contenedores_|
| **docker rm nombre_contenedor o id**|_Borra un contenedor_|
| **docker run**|_Crear un contenedor_|
| **docker start nombre_contenedor**|_Inicia el contenedor _|
| **docker stop nombre_contenedor**|_Detiene el contenedor _|
| **docker rm nombre o id**|_Borra un contenedor que no este en ejecucion_|
| **docker rm -f nombre o id**|_Borra un contenedor que este en ejecucion_|
| **docker volume ls**|_Muestra los volumenes que estan en ejecucion_|
| **docker volume create nombre-volumen**|_Crea un nuevo volumen_|
| **docker volume rm nombre-volumen**|_Borra un volumen_|