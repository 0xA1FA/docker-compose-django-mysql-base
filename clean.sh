echo "Cleaning files (including the git files"

rm docker-images/django/Dockerfile.tpl
rm docker-images/django/app/settings.tpl.org
rm docker-compose.tpl
rm .gitignore
rm -rf .git
