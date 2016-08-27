
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


