mongo_install()
{

if [[ $osversion = 18* ]]; then
	echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list
  elif [[ $osversion = 20* ]]; then
	echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list
  else
    echo "Unknown Version"
    exit 1
  fi

apt-get update
apt-get install -y mongodb-org

}


packages()
{
  apt install python3-pip git python3
}

mongo_services()
{
  systemctl enable --now mongodb
}


