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
- make the django migration with : docker exec -it $(docker ps | grep web | awk '{split($0,a," "); print a[1]}') python3 manage.py migrate

# known issues

## 1 - Can't connect to the mysql server on '10.5.0.5' on first start
- Details : This is because the web application is started before the database server as finished it's initilization setup.
Which indicate that the version od the docker-compose you have dosen't support the depends_on feature.

- Solution : 
Juste stop the docker-compose with a ctrl+c and do a docker-compose up again, and it should be all good.
