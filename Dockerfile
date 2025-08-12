FROM python:3.13

WORKDIR /data

RUN python manage.py migrate

COPY . .

RUN python manage.py migrate

EXPOSE 8000

CMD ["python","manage.py","runserver","0.0.0.0:8000"]


