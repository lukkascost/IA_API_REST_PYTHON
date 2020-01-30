FROM python:3.8

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY requirements.txt /usr/src/app/
RUN pip install --upgrade pip
RUN pip install --trusted-host files.pythonhosted.org --no-cache --no-cache-dir --upgrade -r requirements.txt

COPY . /usr/src/app

ENV TZ=America/Fortaleza
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ENV PYTHONPATH=.:/usr/src/app

CMD cd /usr/src/app &&  python wsgi.py