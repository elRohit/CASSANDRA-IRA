
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
4. Cqlsh no funciona amb el certificat en el format generat. Openssl s'utilitza per generar un fitxer PEM del certificat sense claus, node0.cer.pem, i un fitxer PEM de la clau sense certificat, node0.key.pem.
   En primer lloc, el truststore de claus s'importa en format PKCS12 a un truststore de claus de destinació, node0.p12:
```
keytool -importkeystore -srckeystore keystore.node0 -destkeystore node0.p12 -deststoretype PKCS12 -srcstorepass cassandra -deststorepass cassandra
openssl pkcs12 -in node0.p12 -nokeys -out node0.cer.pem -passin pass:cassandra
openssl pkcs12 -in node0.p12 -nodes -nocerts -out node0.key.pem -passin pass:cassandra
```
5. Per a l'encriptació client-remote-node o l'encriptació node-a-node, utilitzem una eina de còpia com ara SCP per a copiar el fitxer node0.cer a cada node. Importa el fitxer al magatzem de confiança després de copiar a cada node. El següent és un exemple de com importar el certificat de node0 al truststore de node1.
```
keytool -import -v -trustcacerts -alias node0 -file node0.cer -keystore truststore.node1
```
6. Ens n'assegurem que el fitxer del truststore de claus només es pot llegir al daemon de Cassandra i no per cap usuari del sistema.
   Comprovem que els certificats existeixen als fitxers keytore i truststore utilitzant keytool -list. L'exemple mostra la comprovació del certificat node1 al fitxer de magatzem de claus i dels certificats node0 i node1 al fitxer truststore.
```
keytool -list -keystore keystore.node1
keytool -list -keystore truststore.node1
```
7. A continuació, haurem d'habilitar la encriptació en cadascún dels nodes modificant el fitxer cassandra.yml:
```
client_encryption_options:
    enabled: true
    # If enabled and optional is set to true encrypted and unencrypted connections are handled.
    optional: false
    keystore: conf/keystore.node0 
    keystore_password: cassandra
    
    require_client_auth: true
    # Set trustore and truststore_password if require_client_auth is true
    truststore: conf/truststore.node0
    truststore_password: cassandra
    protocol: TLS
    algorithm: SunX509
    store_type: JKS
    cipher_suites: [TLS_RSA_WITH_AES_256_CBC_SHA]
```
