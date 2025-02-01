import mysql.connector

db_config = {
    'host': 'localhost',
    'user': 'root',
    'password': 'sumanth@2004',
    'database': 'bloodreportdb'
}

try:
    conn = mysql.connector.connect(**db_config)
    print("Database connection successful!")
   

    conn.close()
except mysql.connector.Error as err:
    print(f"Error: {err}")
