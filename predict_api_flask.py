from flask import Flask
from flask_restful import Resource, Api, reqparse
import pandas as pd

# The model is run in the get_request module outside the api to account for complicated models
# that could take a few seconds/minutes to run.

app = Flask(__name__)
api = Api(app)


class Predict(Resource):
    def get(self):
        data = pd.read_csv('user_sentiments.csv')
        data = data.to_dict('list')  # convert dataframe to dictionary
        return {'data': data}, 200  # return data and 200 OK code
        # I am wondering if I should yield each one individually here.
        # It depends on the application. For this very simple scenario, I guess it doesn't matter.

    # HERE I would add other methods: POST, PUT, DELETE, etc..


api.add_resource(Predict, '/predict')


if __name__ == '__main__':
    app.run()
