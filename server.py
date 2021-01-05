from pymongo import MongoClient
from flask import Flask, request

import json

app = Flask(__name__)

client = MongoClient("localhost", 27017)
db = client['ansibledb']
servers = db.servers

@app.route('/api/setup')
def setup():
    servers.create_index("ansible_fqdn")
    servers.create_index("ansible_kernel")
    return servers.index_information()

@app.route('/api/ansiblefacts', methods=['POST'])
def ansiblefacts():
    if request.method == 'POST':
        content = json.loads(request.data)
        fqdn =  content["ansible_facts"]["ansible_fqdn"]
        #servers.insert_one(content)
        servers.update({"ansible_facts.ansible_fqdn":fqdn}, {"$set": content }, True)
    return content


@app.route('/api/servers', methods=['GET'])
def ansibleservers():
    cursor = servers.find({}, {'_id': False})
    list_result = list(cursor)
    result = json.dumps(list_result,default=str)
    return result

if __name__ == '__main__':
    #app.run(debug=True, host='0.0.0.0') ## Debug Flask app
    app.run(host='0.0.0.0')
