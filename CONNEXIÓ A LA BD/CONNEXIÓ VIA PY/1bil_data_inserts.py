import random
from cassandra.cluster import Cluster

ciudades = ["Hamburg", "Berlin", "Munich", "Paris", "London", "Madrid", "Lloret", "Blanes"]

#params = {"contact_points": ["172.22.0.2"], "port": 9042}

cluster = Cluster(contact_points=['172.22.0.2'], port=9042)
session = cluster.connect()
session.execute("DROP KEYSPACE IF EXISTS billon;")
session.execute("CREATE KEYSPACE IF NOT EXISTS billon WITH REPLICATION = {'class': 'SimpleStrategy', 'replication_factor': 1};")
session.execute("USE billon;")
session.execute("CREATE TABLE IF NOT EXISTS billon (id UUID PRIMARY KEY,ciudad TEXT, dia DATE);")
print(f"{random.randint(2022, 2023):04d}-{random.randint(1, 12):02d}-{random.randint(1, 31):02d}")
#Bendpoint OKey
for i in range(1000000000):
    o = 0
    o += 1
    ciudad = random.choice(ciudades)
    dia = f"{random.randint(2022, 2023):04d}-{random.randint(1, 12):02d}-{random.randint(1, 31):02d}"
    temperatura = round(random.uniform(-10, 40), 1)
    session.execute(f"INSERT INTO billon (id,ciudad, dia) VALUES ({o},'{ciudad}', '{dia}');")

session.execute("CREATE INDEX IF NOT EXISTS idx ON billon (ciudad, dia);")
result = session.execute("SELECT MAX(temperatura), MIN(temperatura), AVG(temperatura) FROM billon GROUP BY ciudad;")
for row in result:
    print(row)