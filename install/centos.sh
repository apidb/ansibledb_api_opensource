mongo_install()
{
  # Centos8
  yum -y localinstall https://repo.mongodb.org/yum/redhat/8/mongodb-org/4.4/x86_64/RPMS/mongodb-org-server-4.4.3-1.el8.x86_64.rpm

}


packages()
{
  yum install python3 git
}

mongo_services()
{
  systemctl enable --now mongod
}

