import random
from datetime import *
import psycopg2
import time as t

ciudades = ["Hamburg", "Berlin", "Munich", "Paris", "London", "Madrid", "Lloret", "Blanes"]
inicio = t.time()
# Connect to PostgreSQL
conn = psycopg2.connect(
    host="localhost",
    port=5432,
    database="bilio",
    user="root",
    password="root"
)
cur = conn.cursor()

# Drop table if exists
cur.execute("DROP TABLE IF EXISTS generate;")

# Create table
cur.execute("CREATE TABLE generate (id SERIAL PRIMARY KEY, ciudad TEXT, dia DATE);")

# Generate and insert data
for i in range(5000):
    ciudad = random.choice(ciudades)
    year = random.randint(2022, 2023)
    month = random.randint(1, 12)
    day = random.randint(1, 28)
    fecha = datetime(year, month, day).strftime('%Y-%m-%d')
    cur.execute("INSERT INTO generate (id, ciudad, dia) VALUES (%s, %s, %s);", (i, ciudad, fecha))
print("Data inserted successfully!")

fim = t.time()
print(f"Temps Execució:{fim - inicio} seg")
# Commit the changes
conn.commit()

# Close the cursor and connection
cur.close()
conn.close()
