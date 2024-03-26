import random
from datetime import *
import psycopg2

ciudades = ["Hamburg", "Berlin", "Munich", "Paris", "London", "Madrid", "Lloret", "Blanes"]

# Connect to PostgreSQL
conn = psycopg2.connect(
    host="localhost",
    port=5432,
    database="your_database",
    user="your_username",
    password="your_password"
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

# Commit the changes
conn.commit()

# Fetch and print the data
cur.execute("SELECT * FROM generate;")
rows = cur.fetchall()
for row in rows:
    print(row)

# Close the cursor and connection
cur.close()
conn.close()
