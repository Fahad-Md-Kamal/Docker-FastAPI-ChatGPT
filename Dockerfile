FROM python:3.9

WORKDIR /src

# VNC and Xvfb
#==============
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \ 
    && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list
RUN apt-get update && apt-get -y install google-chrome-stable

RUN apt-get update -y \
    && apt-get -y install xvfb \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/*

COPY ./src/requirements.txt /src/requirements.txt
RUN pip install --no-cache-dir --upgrade -r /src/requirements.txt
COPY ./src /src/
