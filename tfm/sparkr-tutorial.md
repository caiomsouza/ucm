###SparkR


https://amplab-extras.github.io/SparkR-pkg/

./sparkR examples/pi.R local[2]


```
Caios-MacBook-Pro:tfm caiomsouza$ sparkr

R version 3.2.2 (2015-08-14) -- "Fire Safety"
Copyright (C) 2015 The R Foundation for Statistical Computing
Platform: x86_64-apple-darwin13.4.0 (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

  Natural language support but running in an English locale

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

Launching java with spark-submit command /usr/local/Cellar/apache-spark/1.6.0/libexec/bin/spark-submit   "sparkr-shell" /var/folders/zg/7n5qfmz10475f9mpn056ylqw0000gn/T//Rtmp67K4Tp/backend_portfde62ed31ec 
log4j:WARN No appenders could be found for logger (io.netty.util.internal.logging.InternalLoggerFactory).
log4j:WARN Please initialize the log4j system properly.
log4j:WARN See http://logging.apache.org/log4j/1.2/faq.html#noconfig for more info.
Using Spark's default log4j profile: org/apache/spark/log4j-defaults.properties
16/04/25 23:12:23 INFO SparkContext: Running Spark version 1.6.0
16/04/25 23:12:25 WARN NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
16/04/25 23:12:25 INFO SecurityManager: Changing view acls to: caiomsouza
16/04/25 23:12:25 INFO SecurityManager: Changing modify acls to: caiomsouza
16/04/25 23:12:25 INFO SecurityManager: SecurityManager: authentication disabled; ui acls disabled; users with view permissions: Set(caiomsouza); users with modify permissions: Set(caiomsouza)
16/04/25 23:12:25 INFO Utils: Successfully started service 'sparkDriver' on port 58765.
16/04/25 23:12:26 INFO Slf4jLogger: Slf4jLogger started
16/04/25 23:12:26 INFO Remoting: Starting remoting
16/04/25 23:12:26 INFO Remoting: Remoting started; listening on addresses :[akka.tcp://sparkDriverActorSystem@192.168.0.15:58766]
16/04/25 23:12:26 INFO Utils: Successfully started service 'sparkDriverActorSystem' on port 58766.
16/04/25 23:12:26 INFO SparkEnv: Registering MapOutputTracker
16/04/25 23:12:26 INFO SparkEnv: Registering BlockManagerMaster
16/04/25 23:12:26 INFO DiskBlockManager: Created local directory at /private/var/folders/zg/7n5qfmz10475f9mpn056ylqw0000gn/T/blockmgr-b2394a7e-15df-4e57-808e-1df2454fc84b
16/04/25 23:12:26 INFO MemoryStore: MemoryStore started with capacity 511.5 MB
16/04/25 23:12:26 INFO SparkEnv: Registering OutputCommitCoordinator
16/04/25 23:12:26 WARN Utils: Service 'SparkUI' could not bind on port 4040. Attempting port 4041.
16/04/25 23:12:26 INFO Utils: Successfully started service 'SparkUI' on port 4041.
16/04/25 23:12:26 INFO SparkUI: Started SparkUI at http://192.168.0.15:4041
16/04/25 23:12:26 INFO Executor: Starting executor ID driver on host localhost
16/04/25 23:12:26 INFO Utils: Successfully started service 'org.apache.spark.network.netty.NettyBlockTransferService' on port 58767.
16/04/25 23:12:26 INFO NettyBlockTransferService: Server created on 58767
16/04/25 23:12:26 INFO BlockManagerMaster: Trying to register BlockManager
16/04/25 23:12:26 INFO BlockManagerMasterEndpoint: Registering block manager localhost:58767 with 511.5 MB RAM, BlockManagerId(driver, localhost, 58767)
16/04/25 23:12:26 INFO BlockManagerMaster: Registered BlockManager

 Welcome to
    ____              __ 
   / __/__  ___ _____/ /__ 
  _\ \/ _ \/ _ `/ __/  '_/ 
 /___/ .__/\_,_/_/ /_/\_\   version  1.6.0 
    /_/ 


 Spark context is available as sc, SQL context is available as sqlContext
> 
```

### Exit Spark
```
> quit();
````








