from flask import jsonify, render_template
import MySQLdb.cursors
from .db import get_conn

def register_routes(app):

    @app.get("/health")
    def health():
        try:
            conn = get_conn()
            cur = conn.cursor()
            cur.execute("SELECT 1")
            cur.fetchone()
            cur.close()
            conn.close()
            return jsonify(status="ok", db="ok")
        except Exception as e:
            return jsonify(status="fail", db="fail", error=str(e)), 500

    @app.get("/")
    def index():
        return render_template("index.html")
