mongo_install()
{
  # Centos8
   deb -i https://repo.mongodb.org/yum/redhat/8/mongodb-org/4.4/x86_64/RPMS/mongodb-org-server-4.4.3-1.el8.x86_64.rpm

}


packages()
{
  apt install python3-pip git python3
}

mongo_services()
{
  systemctl enable --now mongodb
}


