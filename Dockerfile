FROM ubuntu:14.04
COPY requirements.txt /tmp
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q python-all python-pip
RUN pip install -qr requirements.txt
COPY app.py app.py
EXPOSE 5000
CMD [ "python", "app.py" ]
