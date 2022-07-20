echo "installing dependencies"
pip3 install -r docker-images/django/app/requirements.txt
echo "What is the name of the project ? :"  
read project_name
cd docker-images/django/app
django-admin startproject $project_name
mv $project_name tmp
mv tmp/* . 
rm -rf tmp
cp settings.tpl.org settings.tpl
sed -i "s/project_name/$project_name/ig" settings.tpl
sed -i "s/DJANGO_DB_NAME/$project_name/g" settings.tpl
sed -i "s/DJANGO_DB_USR/$project_name/g" settings.tpl

echo "What is the database password of the django mysql database ? :"
read -s django_db_pwd
sed -i "s/DJANGO_DB_PWD/$django_db_pwd/g" settings.tpl

mv settings.tpl $project_name/settings.py

cd ../
cp Dockerfile.tpl Dockerfile

sed -i "s/project_name/$project_name/ig" Dockerfile


cd ../../
cp docker-compose.tpl docker-compose.yml
echo "What is the root password of the mysql database server ? :"  
read -s dbrootpwd
sed -i "s/DB_ROOT_PWD/$dbrootpwd/g" docker-compose.yml

mkdir db
echo "create database $project_name">./db/init.sql
echo "CREATE USER '$project_name'@'10.5.0.5' IDENTIFIED WITH mysql_native_password BY '$django_db_pwd';">>./db/init.sql
echo "GRANT ALL PRIVILEGES ON $project_name.* TO '$project_name'@'10.5.0.5' WITH GRANT OPTION;">>./db/init.sql
echo "FLUSH PRIVILEGES;">>./db/init.sql

ln -s docker-images/django/app/ $project_name
