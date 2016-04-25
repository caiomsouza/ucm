val result = sc.parallelize(Array(1,2,3,4,5)).map(x => x*x).collect()
result.foreach(x => println(x))
System.exit(0)


