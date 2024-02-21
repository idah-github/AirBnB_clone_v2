#!/usr/bin/python3
"""
Starts flask /app setup and and routes
"""

from flask import Flask
app = Flask(__name__)

@app.route("/", strict_slashes=False)
def helloo():
    return "Hello HBNB!"

@app.route("/hbnb", strict_slashes=False)
def hbnb():
    return "HBNB"
@app.route("/c/<text>", strict_slashes=False)
def c(text):
    """Display 'C' flwd by value of <text>"""
    text = text.replace("_", " ")
    return f"C {text}"

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)
