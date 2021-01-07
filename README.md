# ansibledb_api_opensource

ansibledb_api_opensource is way to send data from ansible to an api and then read that data. You will need to install the ansibledb-opensource collection from Ansible galaxy and configure it to point to your API server

This is the API Server that recieves requests from Ansible and also offers an end point to get your data

## Installation

Clone the Repository
```bash
$ git clone https://github.com/apidb-io/ansibledb_api_opensource.git
$ cd ansibledb_api_opensource/
```

Install python3 and requirements (YUM based)
```bash
$ yum install python3
$ pip3 install -r requirements.txt
```

Install python3 and requirements (APT based)
```bash
$ apt-get update
$ apt install python3 python3-pip
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

#### Example: Ubuntu 18.04 (Mongo version 3.6)
```bash
apt install mongodb
systemctl enable --now mongodb
systemctl status mongodb
```

## Running the Server

```bash
python3 server.py
```

## Usage

#### Get Server Versions (using JQ to filter)

Install JQ:
````
apt/yum install jq
````

Now use JQ to pull out the data you want to see.
```bash
curl -s http://<URL>/api/servers | jq '[.[] | {name:.ansible_facts.ansible_fqdn, distribution:.ansible_facts.ansible_distribution,  version: .ansible_facts.ansible_distribution_version}]'
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
