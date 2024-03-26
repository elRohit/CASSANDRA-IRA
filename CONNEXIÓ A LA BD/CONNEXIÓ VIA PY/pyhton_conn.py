#Pip install cassandra-driver
from cassandra.cluster import Cluster

# Establecer conexión con el clúster de Cassandra
cluster = Cluster(contact_points=['172.22.0.2'], port=9042)  # Reemplaza 'localhost' con la dirección IP del clúster

# Crear una sesión
session = cluster.connect()

# Ejecutar una consulta
session.execute("USE institut;")
result = session.execute("SELECT * FROM institut.alumnes;")

# Procesar los resultados
for row in result:
    print(row)

# Cerrar la sesión y la conexión
session.shutdown()
cluster.shutdown()