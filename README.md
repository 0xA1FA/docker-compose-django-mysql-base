# docker-compose-django-mysql-base

This is a docker-compose startup project for django and mysql
# dependencies
- apt-get install docker
- apt-get install docker-compose
- apt-get install python3
- apt-get install python3-pip
- apt-get install python3-django
- apt-get install libmysqlclient-dev

# usage
- git clone https://github.com/0xA1FA/docker-compose-django-mysql-base.git
- cd docker-compose-django-mysql-base
- ./init.sh
-  Follow the process to create the django project
- ./cleanup.sh to remove the template files and the git repository.
- docker-compose up
- http://localhost:8000 and you are good to go with a docker-compose django project linked to a mysql db.

