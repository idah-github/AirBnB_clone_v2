#!/usr/bin/python3
"""
Starts flask /app setup and and rtns Hellobnb
"""

from flask import Flask
app = Flask(__name__)

@app.route("/", strict_slashes=False)
def helloo():
    return "Hello HBNB!"

if __name__ == "__main__":
    app.run(hosts='0.0.0.0', port=5000)
