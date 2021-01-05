# ansibledb-opensource

ansibledb-opensource is way to send data from ansible to an api and then read that data. 

## Installation

Clone the Repository
```bash
git clone https://github.com/apidb-io/ansibledb-opensource.git
```

Install python3 and requirements
```bash
yum install python3
pip3 install -r requirements.txt
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

```



## Running the Server

```bash
python3 server.py
```

## Usage

### Get Server Versions (using JQ to filter)
```bash
curl -s http://<URL>/api/servers | jq '[.[] | {name:.ansible_facts.ansible_fqdn, distribution:.ansible_facts.ansible_distribution,  version: .ansible_facts.ansible_distribution_version}]'
```

## Production
In order to use this in production, we suggest using uwsgi and something like nginx in front of it.

```url
https://www.digitalocean.com/community/tutorials/how-to-serve-flask-applications-with-uwsgi-and-nginx-on-centos-7
``` 


## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)
