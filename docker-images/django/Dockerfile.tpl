FROM python:3.8
ENV PYTHONUNBUFFERED 1
WORKDIR /app
COPY ./app/requirements.txt /app/requirements.txt
COPY ./app/manage.py /app/manage.py
RUN apt-get install libmariadb-dev 
RUN pip install -r requirements.txt
RUN mkdir -p /app/project_name
COPY ./app/project_name /app/project_name
 
