
# Introducció

El xifratge client-node protegeix les dades en vol de les màquines client a un clúster de base de dades utilitzant SSL (Secure Sockets Layer). Estableix un canal segur entre el client i el node coordinador.

# Passos a seguir
## Requisits previs
-  Un certificat autofirmat per utilitzar l'encriptació SSL per a l'encriptació client-node o l'encriptació node-node.
  
1. Generar un parell de claus privades i públiques a cada node del clúster. Utilitzeu un àlies que identifiqui el node. Indicadors de la contrasenya, el dname (nom i cognoms, la unitat organitzativa, l'organització, la ciutat, l'estat, el país) i la contrasenya clau. El nom s'ha de generar amb el valor CN com a adreça IP o FQDN per al node.
```
keytool -genkey -keyalg RSA -alias node0 -keystore keystore.node0 -storepass cassandra -keypass cassandra -dname "CN=172.24.0.0, OU=None, O=None, L=None, C=None"
```
2. Exportem la part pública del certificat a un fitxer separat.
```
keytool -export -alias cassandra -file node0.cer -keystore .keystore
```
3. Afegim el certificat node0.cer al truststore de confiança node0 del node utilitzant l'ordre keytool -import.
```
keytool -import -v -trustcacerts -alias node0 -file node0.cer -keystore truststore.node0
```
