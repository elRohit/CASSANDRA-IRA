# Instal·lació de Cassandra

En aquest document, aprendrem com instal·lar Cassandra en dues plataformes diferents: Docker i Linux.

En docker hi ha dos formes de instal·lar el servei Cassandra, amb `DOCKER-COMPOSE` o de forma manual amb `LINIA DE COMANDES`

## Instal·lació de Cassandra en Docker (LINIA DE COMANDES)

Per instal·lar Cassandra en Docker, segueix els passos següents:

1. Assegura't que Docker està instal·lat i en funcionament al teu sistema.
2. Descarrega la imatge de Cassandra des del Docker Hub.
3. Crea un contenidor de Cassandra utilitzant la imatge descarregada.
4. Interactua amb Cassandra utilitzant eines com `cqlsh` o `nodetool`.

## Instal·lació de Cassandra en Docker (DOCKER-COMPOSE)

per fer-hi una idea, docker compose és un arxiu de configuració on podem especificar esl serveis, xarxes i altres paràmetres que volem crear , una vegada s'ha fet, es guarda en un tipus d'expensio específic i a fer correr la configuració.

Per instal·lar Cassandra en Docker, segueix els passos següents:

1. Assegura't que Docker està instal·lat i en funcionament al teu sistema.
2. Obre un nou arxiu amb `VSCode` o un editor qualsevol
3. Ageiex codi per crear les instàncies, exemple:
```
version: "3.8"
services:
  cassandra-db:
    image: cassandra:latest
    restart: always
    ports:
      - "9042:9042"
    networks:
      - cass

networks:
  cass:
    ipam:
      config:
        - subnet: 172.24.0.0/16
```
4. Una vegada s'ha fet el codi, guuardem el fitxer amb nom `docker-compose.yml`.
5. Obrim la terminal i amb las comanda `cd` ens moguem entre els directoris fins arribar al firectori on s'ha guardat el fitxer de `docker-compose.yml`.
6. Executem la comanda en Windows: `docker-compose up -d` o en Linux: `sudo docker-compose up -d`

[Exemple De docker-compose.yml](<INSTAL·LACIÓ DOCKER/docker-compose.yml>)

## Instal·lació de Cassandra en Linux

Per instal·lar Cassandra en Linux, segueix els passos següents:

1. Actualitza el sistema.
2. Instal·la Java Development Kit (JDK).
3. Descarrega el paquet de Cassandra des del lloc web oficial de Apache Cassandra.
4. Descomprimeix el paquet i mou el directori descomprimit a la ubicació desitjada.
5. Configura les variables d'entorn.
6. Reinicia la terminal o la finestra de comandes.
7. Inicia el servidor de Cassandra.
8. Cassandra està instal·lat i en funcionament al teu sistema Linux.

Ara ja estàs preparat per començar a utilitzar Cassandra en Docker o en Linux. Assegura't de consultar la documentació oficial de Cassandra per obtenir més informació i aprendre com utilitzar aquesta base de dades distribuïda.