from typing import List, Dict
from flask import Flask
import json

from data import Articles

app = Flask(__name__)

def my_articles() -> List[Dict]:
    articles = Articles()
    return articles

@app.route('/')
def index() -> str:
    return json.dumps({'my_articles': my_articles()})

if __name__ == '__main__':
    app.run(host='0.0.0.0')
