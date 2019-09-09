
from flask import Flask, request, render_template

application = Flask(__name__)

@application.route('/', methods=['GET', 'POST'])
def home():
    return render_template("index.html", title="Welcome!")

if __name__ == '__main__':
    application.run()