### Run Hive

Links:
https://cwiki.apache.org/confluence/display/Hive/GettingStarted


https://cwiki.apache.org/confluence/display/Hive/LanguageManual+DDL



```
hive
```

Output:
```
hive@r2d2:~$ hive
SLF4J: Class path contains multiple SLF4J bindings.
SLF4J: Found binding in [jar:file:/home/opt/hive/apache-hive-2.0.0-bin/lib/hive-jdbc-2.0.0-standalone.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: Found binding in [jar:file:/home/opt/hive/apache-hive-2.0.0-bin/lib/log4j-slf4j-impl-2.4.1.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: Found binding in [jar:file:/home/opt/tez/tez-0.8.2/lib/slf4j-log4j12-1.7.10.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: Found binding in [jar:file:/home/opt/hadoop/hadoop-2.7.2/share/hadoop/common/lib/slf4j-log4j12-1.7.10.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: See http://www.slf4j.org/codes.html#multiple_bindings for an explanation.
SLF4J: Actual binding is of type [org.apache.logging.slf4j.Log4jLoggerFactory]

Logging initialized using configuration in file:/home/opt/hive/apache-hive-2.0.0-bin/conf/hive-log4j2.properties
hive>

```

Show tables

```
hive> show tables;
OK
employee
invites
pokes
u_data
Time taken: 0.909 seconds, Fetched: 4 row(s)
hive>

```

Select 

```
hive> select * from employee;
OK
Michael	["Montreal","Toronto"]	{"sex":"Male","age":30}	{"DB":80}	{"Product":["Developer^DLead"]}
Will	["Montreal"]	{"sex":"Male","age":35}	{"Perl":85}	{"Product":["Lead"],"Test":["Lead"]}
Shelley	["New York"]	{"sex":"Female","age":27}	{"Python":80}	{"Test":["Lead"],"COE":["Architect"]}
Lucy	["Vancouver"]	{"sex":"Female","age":57}	{"Sales":89,"HR":94}	{"Sales":["Lead"]}
Time taken: 0.157 seconds, Fetched: 4 row(s)
hive>
```

Exit
```
hive> exit;
```


Run a .SQL Script in Hive 
```
beeline -u jdbc:hive2://localhost:10000/tweets -n hive -f t.sql
```


beeline -u jdbc:hive2://localhost:10000/ -n hive 
  901  ls
  902  hive
  903  hadoop fs -ls /user/hive
  904  beeline -?
  905  beeline -u jdbc:hive2://localhost:10000/tweets -n hive 
  906  hadoop fs -ls /user/hive
  907  beeline -u jdbc:hive2://localhost:10000/tweets -n hive 
  908  beeline -u jdbc:hive2://localhost:10000/tweets -n hive -f t.sql 
  909  ls
  910  vi t.sql 
  911  emacs t.sql 
  912  beeline -u jdbc:hive2://localhost:10000/tweets -n hive -f t.sql 
  913  emacs t.sql 
  914  ls
  915  emacs t2.sql
  916  exit
  917  cd caio/
  918  emacs t2.sql


beeline -u jdbc:hive2://localhost:10000/tweets -n hive -f t.sql


hadoop fs -ls /usr/hive
  726  hadoop fs -ls /user/hive
  727  hadoop fs -ls /user/hive/foodmart.db/
  728  hadoop fs -cp /user/hive/foodmart.db/sales_fact .
  729  more sales_fact
  730  ls -al
  731  cd
  732  hadoop fs -cp /user/hive/foodmart.db/sales_fact .
  733  ls
  734  hadoop fs -get /user/hive/foodmart.db/sales_fact 
  735  ls
  736  cd sales_fact/


### Hadoop


```
hadoop fs -ls /user/hive/
```

Output:
```
hive@r2d2:~$ hadoop fs -ls /user/hive/
SLF4J: Class path contains multiple SLF4J bindings.
SLF4J: Found binding in [jar:file:/home/opt/hadoop/hadoop-2.7.2/share/hadoop/common/lib/slf4j-log4j12-1.7.10.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: Found binding in [jar:file:/home/opt/tez/tez-0.8.2/lib/slf4j-log4j12-1.7.10.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: See http://www.slf4j.org/codes.html#multiple_bindings for an explanation.
SLF4J: Actual binding is of type [org.slf4j.impl.Log4jLoggerFactory]
Found 11 items
drwxr-xr-x   - hive supergroup          0 2016-04-11 14:26 /user/hive/.hiveJars
drwxr-xr-x   - hive supergroup          0 2016-04-11 16:41 /user/hive/HiveFoodmartData
drwxrwxrwx   - hive supergroup          0 2016-04-11 12:49 /user/hive/employee
drwxrwxrwx   - hive supergroup          0 2016-04-11 16:41 /user/hive/foodmart.db
drwxrwxrwx   - hive supergroup          0 2016-04-25 20:09 /user/hive/invites
drwxrwxrwx   - hive supergroup          0 2016-04-10 17:18 /user/hive/patata.db
drwxrwxrwx   - hive supergroup          0 2016-04-25 20:09 /user/hive/pokes
drwxr-xr-x   - hive supergroup          0 2016-04-25 17:11 /user/hive/sales_fact
drwx-wx-wx   - hive supergroup          0 2016-04-11 11:58 /user/hive/tmp
drwxrwxrwx   - hive supergroup          0 2016-04-25 21:09 /user/hive/tweets.db
drwxrwxrwx   - hive supergroup          0 2016-04-25 20:18 /user/hive/u_data
hive@r2d2:~$
```


```
hadoop fs -ls /user/hive/foodmart.db/
```

Output:
```
hive@r2d2:~$ hadoop fs -ls /user/hive/foodmart.db/
SLF4J: Class path contains multiple SLF4J bindings.
SLF4J: Found binding in [jar:file:/home/opt/hadoop/hadoop-2.7.2/share/hadoop/common/lib/slf4j-log4j12-1.7.10.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: Found binding in [jar:file:/home/opt/tez/tez-0.8.2/lib/slf4j-log4j12-1.7.10.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: See http://www.slf4j.org/codes.html#multiple_bindings for an explanation.
SLF4J: Actual binding is of type [org.slf4j.impl.Log4jLoggerFactory]
Found 34 items
drwxrwxrwx   - hive supergroup          0 2016-04-11 16:41 /user/hive/foodmart.db/account
drwxrwxrwx   - hive supergroup          0 2016-04-11 16:41 /user/hive/foodmart.db/agg_c_10_sales_fact_1997
drwxrwxrwx   - hive supergroup          0 2016-04-11 16:41 /user/hive/foodmart.db/agg_c_14_sales_fact_1997
drwxrwxrwx   - hive supergroup          0 2016-04-11 16:41 /user/hive/foodmart.db/agg_c_special_sales_fact_1997
drwxrwxrwx   - hive supergroup          0 2016-04-11 16:41 /user/hive/foodmart.db/agg_g_ms_pcat_sales_fact_1997
drwxrwxrwx   - hive supergroup          0 2016-04-11 16:41 /user/hive/foodmart.db/agg_l_03_sales_fact_1997
drwxrwxrwx   - hive supergroup          0 2016-04-11 16:41 /user/hive/foodmart.db/agg_l_04_sales_fact_1997
drwxrwxrwx   - hive supergroup          0 2016-04-11 16:41 /user/hive/foodmart.db/agg_l_05_sales_fact_1997
drwxrwxrwx   - hive supergroup          0 2016-04-11 16:41 /user/hive/foodmart.db/agg_lc_06_sales_fact_1997
drwxrwxrwx   - hive supergroup          0 2016-04-11 16:41 /user/hive/foodmart.db/agg_lc_100_sales_fact_1997
drwxrwxrwx   - hive supergroup          0 2016-04-11 16:41 /user/hive/foodmart.db/agg_ll_01_sales_fact_1997
drwxrwxrwx   - hive supergroup          0 2016-04-11 16:41 /user/hive/foodmart.db/agg_pl_01_sales_fact_1997
drwxrwxrwx   - hive supergroup          0 2016-04-11 16:41 /user/hive/foodmart.db/category
drwxrwxrwx   - hive supergroup          0 2016-04-11 16:41 /user/hive/foodmart.db/currency
drwxrwxrwx   - hive supergroup          0 2016-04-11 16:41 /user/hive/foodmart.db/customer
drwxrwxrwx   - hive supergroup          0 2016-04-11 16:41 /user/hive/foodmart.db/days
drwxrwxrwx   - hive supergroup          0 2016-04-11 16:41 /user/hive/foodmart.db/department
drwxrwxrwx   - hive supergroup          0 2016-04-11 16:41 /user/hive/foodmart.db/employee
drwxrwxrwx   - hive supergroup          0 2016-04-11 16:41 /user/hive/foodmart.db/employee_closure
drwxrwxrwx   - hive supergroup          0 2016-04-11 16:41 /user/hive/foodmart.db/expense_fact
drwxrwxrwx   - hive supergroup          0 2016-04-11 16:41 /user/hive/foodmart.db/inventory_fact
drwxrwxrwx   - hive supergroup          0 2016-04-11 16:41 /user/hive/foodmart.db/position
drwxrwxrwx   - hive supergroup          0 2016-04-11 16:41 /user/hive/foodmart.db/product
drwxrwxrwx   - hive supergroup          0 2016-04-11 16:41 /user/hive/foodmart.db/product_class
drwxrwxrwx   - hive supergroup          0 2016-04-11 16:41 /user/hive/foodmart.db/promotion
drwxrwxrwx   - hive supergroup          0 2016-04-11 16:41 /user/hive/foodmart.db/region
drwxrwxrwx   - hive supergroup          0 2016-04-11 16:41 /user/hive/foodmart.db/reserve_employee
drwxrwxrwx   - hive supergroup          0 2016-04-11 16:41 /user/hive/foodmart.db/salary
drwxrwxrwx   - hive supergroup          0 2016-04-11 16:41 /user/hive/foodmart.db/sales_fact
drwxrwxrwx   - hive supergroup          0 2016-04-11 16:41 /user/hive/foodmart.db/store
drwxrwxrwx   - hive supergroup          0 2016-04-11 16:41 /user/hive/foodmart.db/store_ragged
drwxrwxrwx   - hive supergroup          0 2016-04-11 16:41 /user/hive/foodmart.db/time_by_day
drwxrwxrwx   - hive supergroup          0 2016-04-11 16:41 /user/hive/foodmart.db/warehouse
drwxrwxrwx   - hive supergroup          0 2016-04-11 16:41 /user/hive/foodmart.db/warehouse_class
hive@r2d2:~$
```


