###SparkR

### Help
```
help();
```

### How to install SparkR
https://amplab-extras.github.io/SparkR-pkg/


### How to start SparkR

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

### Example of R Script

```

# Code by Caio Moreno (caiofern@ucm.es)

# Installing SparkR
#https://amplab-extras.github.io/SparkR-pkg/

#https://spark.apache.org/docs/latest/sparkr.html#from-hive-tables

#SparkR - Code
#install.packages("SparkR")

spark_path <- strsplit(system("brew info apache-spark",intern=T)[4],' ')[[1]][1] # Get your spark path
.libPaths(c(file.path(spark_path,"libexec", "R", "lib"), .libPaths())) # Navigate to SparkR folder
library(SparkR) # Load the library
sparkR.stop()
sc <- sparkR.init(master="local")
#SparkR - Code

# Iris Dataset Example
dataset.test <- iris

#SparkR - Code
sc <- sparkR.init()
sqlContext <- sparkRSQL.init(sc)
# Create the DataFrame
sparkr.df <- createDataFrame(sqlContext, dataset.test) 

head(sparkr.df)

# Load a JSON file
twitters_json <- read.df(sqlContext, "/Users/caiomsouza/git/github.com/TwitterRawData/examples/example-of-twitter-dataset.js", "json")

# Register this DataFrame as a table.
registerTempTable(twitters_json, "twitters")

# SQL statements can be run by using the sql method
test_twitter <- sql(sqlContext, "SELECT * FROM twitters")
head(test_twitter)
str(test_twitter)

test_twitter2 <- sql(sqlContext, "SELECT text FROM twitters")
head(test_twitter2)

# The code below is not working yet.

# sc is an existing SparkContext.
hiveContext <- sparkRHive.init(sc)

sql(hiveContext, "CREATE TABLE IF NOT EXISTS src (key INT, value STRING)")
sql(hiveContext, "LOAD DATA LOCAL INPATH 'examples/src/main/resources/kv1.txt' INTO TABLE src")

# Queries can be expressed in HiveQL.
results <- sql(hiveContext, "FROM src SELECT key, value")

# results is now a DataFrame
head(results)
##  key   value
## 1 238 val_238
## 2  86  val_86
## 3 311 val_311


sparkR.stop()


```







