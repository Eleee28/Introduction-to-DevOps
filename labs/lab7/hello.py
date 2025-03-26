from flask import Flask

app = Flask(__name__)

@app.route("/")
def hello():
	return '<p>Hello, World!</p> <a href="/about">About</a>'

@app.route("/about")
def about():
	return "<p>This is a Flask web app running in a Linux VM</p>"