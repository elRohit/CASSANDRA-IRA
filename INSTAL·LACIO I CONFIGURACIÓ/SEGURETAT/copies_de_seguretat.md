
# Introducció

Les còpies de seguretat són una pràctica essencial per protegir les dades i la informació important. Una còpia de seguretat és una còpia duplicada dels fitxers o de tot el sistema que es guarda en un lloc segur per a poder recuperar-los en cas de pèrdua, corrupció o altres problemes.

# Objectiu
L'onjectiu d'aquesta part és mostrar com fer una bàsica còpia de seguretat de las dades, en cas de pèrdua de dades o caiguda de servidor, per a que les dades persisteixin, neceitarem algun mètode per garantir que les dades estan segures.

# Passos a seguir
## Requisits previs
-  Comprova que tens la màquina fncionant i docker funcionant
-  Comprova que funciona la base de dades amb Cassandra i que fa Ping

1. Primerament entra a la consola de `cqlsh` i prova de fer a comanda per copiar els registres a un fitxer extern
```
COPY institut.alumnes TO 'alumnes.csv' WITH DELIMITER = ';';
```
2. Per automatitzar utilitzarem `crontab`, i un arxiu python per a que axecuti automaticament les copies
```
'copiar.py'

from cassandra.cluster import Cluster

cluster = Cluster(contact_points=['172.22.0.2'], port=9042)  # Reemplaza 'localhost' con la dirección IP del clúster


session = cluster.connect()


session.execute("USE institut;")
result = session.execute("COPY institut.alumnes TO 'alumnes.csv' WITH DELIMITER = ';';")

session.shutdown()
cluster.shutdown()

```
I executem en bash les següents comandes:
```
crontab -e 
1
0 0 * * * userdba-cassandra.db-1:/copiar.py
Ctrl+O(Save) & Ctrl+X(Exit)

```
