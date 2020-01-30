
from flask import Flask, Blueprint

app = Flask(__name__)

def initialize_app(app):
    app.config['RESTPLUS_VALIDATE'] = True
    app.config['ERROR_404_HELP'] = False
    app.config['RESTPLUS_MASK_SWAGGER'] = False

    blueprint = Blueprint('api', __name__)
    app.register_blueprint(blueprint)


if __name__ == "__main__":
    initialize_app(app)
    app.run(host='0.0.0.0', port=8051)