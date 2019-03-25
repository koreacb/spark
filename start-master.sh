#!/bin/sh

jupyter lab --ip 0.0.0.0 --port 8888 --allow-root &

sleep 10

# ipcluster start &

# pyspark &

sleep 10

/livy/livy-0.5.0-incubating-bin/bin/livy-server start &

sleep 10

/spark/bin/pyspark 

sleep 10

/spark/bin/spark-class org.apache.spark.deploy.master.Master \
    --port $SPARK_MASTER_PORT \
    --webui-port $SPARK_MASTER_WEBUI_PORT \

#/spark/bin/spark-class org.apache.spark.deploy.master.Master \
#    --ip $SPARK_LOCAL_IP \
#    --port $SPARK_MASTER_PORT \
#    --webui-port $SPARK_MASTER_WEBUI_PORT \

#jupyter notebook --ip 0.0.0.0 --port 8888 --allow-root
