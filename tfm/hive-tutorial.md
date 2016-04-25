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






