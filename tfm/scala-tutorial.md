### Basic about Scala

###Scala by Example
http://www.scala-lang.org/docu/files/ScalaByExample.pdf


### Run a Scala Test Script

```
spark-shell -i scala-example.scala

```

Output:
```

Caios-MacBook-Pro:tfm caiomsouza$ vi scala-example.scala
Caios-MacBook-Pro:tfm caiomsouza$ spark-shell -i scala-example.scala 
log4j:WARN No appenders could be found for logger (org.apache.hadoop.metrics2.lib.MutableMetricsFactory).
log4j:WARN Please initialize the log4j system properly.
log4j:WARN See http://logging.apache.org/log4j/1.2/faq.html#noconfig for more info.
Using Spark's repl log4j profile: org/apache/spark/log4j-defaults-repl.properties
To adjust logging level use sc.setLogLevel("INFO")
Welcome to
      ____              __
     / __/__  ___ _____/ /__
    _\ \/ _ \/ _ `/ __/  '_/
   /___/ .__/\_,_/_/ /_/\_\   version 1.6.0
      /_/

Using Scala version 2.10.5 (Java HotSpot(TM) 64-Bit Server VM, Java 1.7.0_67)
Type in expressions to have them evaluated.
Type :help for more information.
16/04/25 23:19:07 WARN Utils: Service 'SparkUI' could not bind on port 4040. Attempting port 4041.
Spark context available as sc.
16/04/25 23:19:09 WARN Connection: BoneCP specified but not present in CLASSPATH (or one of dependencies)
16/04/25 23:19:09 WARN Connection: BoneCP specified but not present in CLASSPATH (or one of dependencies)
16/04/25 23:19:12 WARN ObjectStore: Version information not found in metastore. hive.metastore.schema.verification is not enabled so recording the schema version 1.2.0
16/04/25 23:19:12 WARN ObjectStore: Failed to get database default, returning NoSuchObjectException
16/04/25 23:19:13 WARN : Your hostname, Caios-MacBook-Pro.local resolves to a loopback/non-reachable address: fe80:0:0:0:c1e:8aff:fed0:c063%8, but we couldn't find any external IP address!
16/04/25 23:19:20 WARN Connection: BoneCP specified but not present in CLASSPATH (or one of dependencies)
16/04/25 23:19:20 WARN Connection: BoneCP specified but not present in CLASSPATH (or one of dependencies)
16/04/25 23:19:22 WARN ObjectStore: Version information not found in metastore. hive.metastore.schema.verification is not enabled so recording the schema version 1.2.0
16/04/25 23:19:22 WARN ObjectStore: Failed to get database default, returning NoSuchObjectException
SQL context available as sqlContext.
Loading scala-example.scala...
result: Array[Int] = Array(1, 4, 9, 16, 25)
1
4
9
16
25

```

