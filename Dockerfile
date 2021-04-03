FROM python:alpine3.12

RUN apk update && apk --no-cache add sudo bash  && rm -rf /var/cache/apk/*

RUN pip3 install bs4
RUN pip3 install lxml

RUN wget https://github.com/ChestnutHeng/Wudao-dict/archive/refs/heads/master.zip \
      && unzip master.zip \
      && rm master.zip \
      && cd /Wudao-dict-master/wudao-dict \
      && ./setup.sh
ENTRYPOINT ["wd"]
