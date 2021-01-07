# ansibledb_api_opensource

ansibledb_api_opensource is way to send data from ansible to an api and then pill out that data and answer questions about your environments. Once **ansibledb_api_opensource** has been setup, install and setup the ansibledb-opensource collection from Ansible galaxy and configure it to point to your API server. **You can find the Galaxy collection here: https://galaxy.ansible.com/apidb/ansibledb_opensource** This make it very easy to collect and store all your server data.

This is the API Server that recieves requests from Ansible and also offers an end point to get your data

## Installation

Clone the Repository
```bash
$ git clone https://github.com/apidb-io/ansibledb_api_opensource.git
$ cd ansibledb_api_opensource/
```

## Install python3 and requirements

### YUM based Insturctions:
```bash
$ yum install python3
$ pip3 install -r requirements.txt
```

#### Install MongoDB Server (Community) from:
```url
https://www.mongodb.com/try/download/community
```

#### Example: Centos 8 (Mongo version 4.4)
```bash
wget https://repo.mongodb.org/yum/redhat/8/mongodb-org/4.4/x86_64/RPMS/mongodb-org-server-4.4.3-1.el8.x86_64.rpm
yum localinstall mongodb-org-server-4.4.3-1.el8.x86_64.rpm
systemctl start mongod 
systemctl enable mongod
systemctl status mongodb
```


### APT based Instructions:
```bash
$ apt-get update
$ apt install python3 python3-pip
$ pip3 install -r requirements.txt
```

#### Install MongoDB Server (Community) from:
```url
https://www.mongodb.com/try/download/community
```

#### Example: Ubuntu 18.04 (Mongo version 3.6)
```bash
apt install mongodb
systemctl enable --now mongodb
systemctl status mongodb
```

## Running MONGODB Server
MongoDB will listen on port :5000. If you are running mongoDB on a remote server, remember to open up the FW to allow traffic on that port. If you're testing it out and running it on localhost, you'll be fine. You can always run this in the background ````nohup python3 server.py &````

```bash
python3 server.py
```

## Now setup ansibledb_opensource:
ansibledb_opensource is a collection of ansible roles to collect facts from all your servers and store them in the mongoDB. With a small amount of setup, you'll be up and running.
**You can find the Galaxy collection here: https://galaxy.ansible.com/apidb/ansibledb_opensource**

### Usage
Once you've send over some data, install JQ and run the following JQ commands to pull out the data you want:

#### Get Server Versions (using JQ to filter)

Install JQ:
````
apt/yum install jq
````

Now use JQ to pull out the data you want to see.

  NOTE: ansibledb_api_IP_address = the IP or servername of where you are running mongoDB
  
#### Pull out all data:
```bash
curl -s http://ansibledb_api_IP_address:5000/api/servers | jq
````

#### List all servernames, distribution and version:
````
curl -s http://ansibledb_api_IP_address:5000/api/servers | jq '[.[] | {name:.ansible_facts.ansible_fqdn, distribution:.ansible_facts.ansible_distribution, version: .ansible_facts.ansible_distribution_version}]'
````

#### Generate a list of servernames that match a specific fact (in this case ubuntu 18.04):
````
curl -s http://ansibledb_api_IP_address:5000/api/servers | jq --arg INPUT "$INPUT" -r '.[] | select(.ansible_facts.ansible_distribution_version | tostring | contains("18.04")) | (.ansible_facts.ansible_fqdn+"\"")'

```

## Production
In order to use this in production, we suggest using uwsgi and something like nginx in front of it.

CentOS 7
```url
https://www.digitalocean.com/community/tutorials/how-to-serve-flask-applications-with-uwsgi-and-nginx-on-centos-7
``` 
Ubuntu 20
```url
https://www.digitalocean.com/community/tutorials/how-to-serve-flask-applications-with-uwsgi-and-nginx-on-ubuntu-20-04
```


## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)
