import os
import MySQLdb

def get_conn():
    return MySQLdb.connect(
        host=os.environ["DB_HOST"],
        user=os.environ["DB_USER"],
        passwd=os.environ["DB_PASS"],
        db=os.environ["DB_NAME"],
        connect_timeout=5,
        charset="utf8mb4"
    )
