#!/bin/sh

jupyter lab --ip 0.0.0.0 --port 8888 --allow-root &

ipcluster start &

pyspark &

/livy/livy-0.5.0-incubating-bin/bin/livy-server start &

/spark/bin/spark-class org.apache.spark.deploy.master.Master \
#    --ip $SPARK_LOCAL_IP \
    --port $SPARK_MASTER_PORT \
    --webui-port $SPARK_MASTER_WEBUI_PORT \

#jupyter notebook --ip 0.0.0.0 --port 8888 --allow-root
