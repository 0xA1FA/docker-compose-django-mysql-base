version: '3.8'
services:
  db:
    image: mysql:8.0
    cap_add:
      - SYS_NICE
    restart: always
    environment:
      - MYSQL_DATABASE=quotes
      - MYSQL_ROOT_PASSWORD=DB_ROOT_PWD
    ports:
      - '3306:3306'
    volumes:
      - db:/var/lib/mysql
      - ./db/init.sql:/docker-entrypoint-initdb.d/init.sql
    networks:
      vpcbr:
        ipv4_address: 10.5.0.5
  web:
    build:
       context: ./docker-images/django/
    command: python3 manage.py runserver 0.0.0.0:8000
    ports:
      - "8000:8000"
    networks:
      vpcbr:
        ipv4_address: 10.5.0.6
    volumes:
      - ./docker-images/django/app:/app
    depends_on:
      - db

volumes:
  db:
    driver: local
networks:
  vpcbr:
    driver: bridge
    ipam:
     config:
       - subnet: 10.5.0.0/16
         gateway: 10.5.0.1
