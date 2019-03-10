#!/bin/sh

jupyter notebook --ip 0.0.0.0 --port 8888 --allow-root &

/spark/bin/spark-class org.apache.spark.deploy.master.Master \
    --ip $SPARK_LOCAL_IP \
    --port $SPARK_MASTER_PORT \
    --webui-port $SPARK_MASTER_WEBUI_PORT \

#jupyter notebook --ip 0.0.0.0 --port 8888 --allow-root
