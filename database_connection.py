import mysql.connector
import pandas as pd

print("1. Program started", flush=True)
print("2. Trying MySQL connection...", flush=True)

try:
    connection = mysql.connector.connect(
        host="127.0.0.1",
        port=3306,
        user="root",
        password="root",
        database="ai_automation_banking",
        connection_timeout=5,
        use_pure=True
    )

    print("3. MySQL connection successful!", flush=True)

    cursor = connection.cursor()

    cursor.execute("SELECT COUNT(*) FROM ai_automation_spend")

    result = cursor.fetchone()

    print("4. Total rows:", result[0], flush=True)

    cursor.close()
    connection.close()

    print("5. Connection closed", flush=True)

except mysql.connector.Error as e:
    print("MYSQL ERROR:", e, flush=True)

except Exception as e:
    print("PYTHON ERROR:", e, flush=True)