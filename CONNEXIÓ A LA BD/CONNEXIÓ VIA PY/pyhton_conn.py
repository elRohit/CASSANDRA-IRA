#Pip install cassandra-driver
from cassandra.cluster import Cluster

# Establecer conexión con el clúster de Cassandra
cluster = Cluster(['localhost'])  # Reemplaza 'localhost' con la dirección IP del clúster

# Crear una sesión
session = cluster.connect()

# Ejecutar una consulta
result = session.execute("SELECT * FROM mi_tabla")

# Procesar los resultados
for row in result:
    print(row)

# Cerrar la sesión y la conexión
session.shutdown()
cluster.shutdown()