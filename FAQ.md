# Preguntas frecuentes (FAQ)

## Que es Apache Cassandra?

Apache cassandra es una base de dades NoSQL, va ser creada per bases de dades amb el fi de gestionar gran volum de dades, 
avui en dia aquest tipus de base de dades ofereixen flexibilitat, escalabilitat i velocitat al navegar entre aquest tipus de dades.

## Quin tipus de SGBD es Apache Cassandra?

És un DBMS **No relacional**, orientat a tipus _COLUMN-FAMILY_, o sigui que guada les seves dades dins de columnes.

## Quins són els requisits del sistema?

Com la majoria de bases de dades, el rendiment de Cassandra millora amb més nuclis de CPU, més RAM i discs més ràpids. 
Tot i que Cassandra es pot fer funcionar en petits servidors per a proves o entorns de desenvolupament (incloent Raspberry Pis), 
un servidor de producció mínim requereix, com a mínim: 

- `2 nuclis` (L'addició de nuclis de CPU addicionals augmenta el rendiment tant de lectures com d'escriptura.)
- `8 GB` de RAM

Cassandra està dissenyat per proporcionar redundància a través de múltiples servidors independents i barats. 
Per tant, els servidors amb múltiples discs sovint se serveixen millor utilitzant `RAID0` o `JBOD` que `RAID1` o `RAID5`.

# Quines versions de Apache Cassandra existeixen?

...

## Quines són les instruccions per arrancar / verificar status / apagar servei de la base de dades?

Per arrancar cassandra:
- `sudo service cassandra start`

Per verificar status:
- `nodetool status` o `service cassandra status`

Per apagar servei:
- `sudo service cassandra stop` o `nodetool stopdaemon`

## A on es troba i quin nom rep el fitxer de configuració?

Es pot trobar al següent directori:
- `/etc/cassandra/cassandra.yaml`

## Com puc veure a quins directoris estan tots els arxius o configuracions de cassandra?
- es poden veure amb varies caomandes que venen en linux definides, com per exemple `whereis` / `find`:
```
sudo whereis cassandra
``` 
o també amb 
```
sudo find . -name cassandra -print
```
## A on es troben físicament els fitxers de dades (per defecte)?

- `/var/lib/cassandra/data/<db_name>/`

## En quins ports escolta Apache Cassandra?

Per defecte, Cassandra utilitza el port 7000 per a la comunicació amb el clúster (7001 si SSL està habilitat).
El port 9042 per als clients de protocol natiu, i 7199 per a JMX. 
Tots els ports són TCP.


## Quina modificació/passos caldrien fer per canviar aquests ports a uns altres?

Els ports de comunicació internode i de protocol natiu són configurables en cassandra-yaml. 
El port JMX és configurable en cassandra-env.sh (a través de les opcions JVM).