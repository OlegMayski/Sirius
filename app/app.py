import os
import json
import datetime
import socket
import base64
import string
import random
from pathlib import Path

from flask import Flask
from flask import request
from flask import jsonify
from flask import render_template

from flask_bootstrap import Bootstrap5

app = Flask(__name__)
bootstrap = Bootstrap5(app)

@app.route("/", methods=["GET"])
def root():
  name = request.args.get('name')
  if name is None: name = ''
  greeting = f"Привет, {name}!"
  greeting_sql = f"SELECT * FROM test WHERE name='{name}'"

  return render_template('index.html', greeting=greeting, name=name)

@app.route("/status/")
def status():
  return jsonify({ 'status': 'ok' })

if __name__ == "__main__":
  app.run()