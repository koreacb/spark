FROM openjdk:8-alpine
MAINTAINER kw.chung@koreacb.com

RUN apk update && apk add --no-cache --update linux-headers musl-dev wget \
    unzip tar bash gcc nodejs curl python3 python3-dev py3-tornado py3-zmq && \
    rm -rf /var/cache/apk/* 

RUN wget http://mirror.apache-kr.org/spark/spark-2.4.0/spark-2.4.0-bin-hadoop2.7.tgz
RUN tar -xzf spark-2.4.0-bin-hadoop2.7.tgz && \
    mv spark-2.4.0-bin-hadoop2.7 /spark && \
    rm spark-2.4.0-bin-hadoop2.7.tgz

ENV SPARK_HOME=/spark

VOLUME ["/tmp"]
 
COPY start-master.sh /start-master.sh
COPY start-worker.sh /start-worker.sh

EXPOSE 8888 8080 7077 8998

RUN pip3 install --upgrade pip setuptools && \
    pip3 install --upgrade jupyter findspark jupyterlab ipyparallel

CMD ipcluster nbextension enable

RUN mkdir /livy && cd /livy && \
    wget http://mirror.apache-kr.org/incubator/livy/0.5.0-incubating/livy-0.5.0-incubating-bin.zip && \
    unzip livy-0.5.0-incubating-bin.zip && \
    rm livy-0.5.0-incubating-bin.zip
     
#CMD jupyter notebook --no-browser --ip 0.0.0.0 --port 8888 --allow-root
