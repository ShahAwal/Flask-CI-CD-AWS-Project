# app.py
from flask import Flask, render_template
import os

app = Flask(__name__)

@app.route('/')
def hello_world():
    # Example: Read an environment variable if needed
    app_version = os.environ.get('APP_VERSION', 'unknown')
    return render_template('index.html', version=app_version)

if __name__ == '__main__':
    # Listen on all available IPs, essential for Docker
    app.run(host='0.0.0.0', port=5000)
