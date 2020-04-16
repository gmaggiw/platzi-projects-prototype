FROM python:3.7

LABEL maintainer="Gustavo Maggi <gmaggiw@gmail.com>"

COPY requirements.txt /tmp/

WORKDIR /tmp

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    build-essential \
    libpcre3-dev \
    libpq-dev \
    && pip install -r requirements.txt

COPY platziprojects /tmp/platziprojects
 
WORKDIR /tmp/platziprojects

RUN python manage.py migrate \
    && python manage.py loaddata projects

CMD ./manage.py runserver 0.0.0.0:8000