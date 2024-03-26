import random
from datetime import *
from cassandra.cluster import Cluster

ciudades = ["Hamburg", "Berlin", "Munich", "Paris", "London", "Madrid", "Lloret", "Blanes"]

#params = {"contact_points": ["172.22.0.2"], "port": 9042}

cluster = Cluster(contact_points=['172.22.0.2'], port=9042)
session = cluster.connect()
session.execute("DROP KEYSPACE IF EXISTS billon;")
session.execute("CREATE KEYSPACE IF NOT EXISTS billon WITH REPLICATION = {'class': 'SimpleStrategy', 'replication_factor': 1};")
session.execute("USE billon;")
session.execute("CREATE TABLE IF NOT EXISTS billon.generate (id int PRIMARY KEY,ciudad TEXT, dia DATE);")
print(f"{random.randint(2022, 2023):04d}-{random.randint(1, 12):02d}-{random.randint(1, 31):02d}")
#Bendpoint OKey
for i in range(5000):
    o = 0
    o += 1
    ciudad = random.choice(ciudades)
    year = random.randint(2022, 2023)
    month = random.randint(1, 12)
    day = random.randint(1, 28)  # Asumiendo máximo de 28 días para simplificar
    fecha = datetime(year, month, day).strftime('%Y-%m-%d')
#    temperatura = round(random.uniform(-10, 40), 1)
    session.execute(f"INSERT INTO billon.generate (id,ciudad, dia) VALUES ({i},'{ciudad}', '{fecha}');")

#session.execute("CREATE INDEX IF NOT EXISTS idx ON billon.generate (ciudad, dia);")
result = session.execute("SELECT * FROM billon.generate;")
for row in result:
    print(row)