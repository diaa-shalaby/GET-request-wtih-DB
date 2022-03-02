import requests
import json
import subprocess

CALL_API = True  # Set to true if you want to call the api from here

if CALL_API:
    # Starting the api in the background
    subprocess.Popen(['python', 'predict_api_flask.py'])
else:
    pass

# GET request from the simple api created by predict_api_flask module
resp = requests.get('http://localhost:5000/predict')

resp = resp.json()['data']


def sentiment_analysis(resp: dict):
    """
    Analyses the sentiment of users based on the response from the http GET endpoint.

    :param resp: response from the endpoint
    :return: predicted sentiment in JSON format
    """
    usernames = resp['username']
    models = resp['model']
    sentences = resp['sentence']

    for username, model, sentence in zip(usernames, models, sentences):
        print(f'Analysing the sentiment of {username}')
        # Authenticate the user
        # ======================
        # The DB could be huge, so I'll read line by line instead of the whole thing at once
        valid_user = False
        with open('user_DB.txt') as f:
            line = f.readline()
            while line:
                if username == line.strip('\n'):
                    valid_user = True
                    break
                line = f.readline()

        if valid_user is False:
            raise ValueError('Username is not valid. Please try again!')

        # Sentiment check
        # ================
        if model == 'happy':
            sentiment = 'happy'

        if model == 'length-based':
            if len(sentence.split('-')) <= 3:
                sentiment = 'happy'

            elif len(sentence.split('-')) > 6:
                sentiment = 'unhappy'

            else:
                sentiment = 'neutral'

        yield json.dumps({'predicted_sentiment': sentiment})


if __name__ == '__main__':
    for sentiment in sentiment_analysis(resp):
        print(sentiment, '\n')
