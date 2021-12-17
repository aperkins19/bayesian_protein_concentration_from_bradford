
# Dockerfile 04/2021
# Python environment for exporting data analysis for processing on remote systems. 

FROM ubuntu:latest
MAINTAINER Alex Perkins <a.j.p.perkins@sms.ed.ac.uk>
RUN apt-get update && apt-get -y update
RUN apt-get install -y build-essential python3.6 python3-pip python3-dev
RUN pip3 -q install pip --upgrade

RUN mkdir src
WORKDIR src/
COPY . .
RUN pip3 install -r requirements.txt
RUN pip3 install jupyter

WORKDIR /src/

CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]