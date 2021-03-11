#!/usr/bin/python

import pymysql
import time

myConnection = pymysql.connect(host='localhost', user='root', passwd='password', db='shakespeare')
cur = myConnection.cursor()

start_time = time.time()	

cur.execute('SELECT play_text FROM amnd;')
for line in cur.fetchall():
    print(line[0])

end_time = time.time()

cur.execute('SELECT count(line_number) FROM amnd;')
numPlayLines = cur.fetchall()[0][0]
print(numPlayLines,'rows')

queryExecTime = end_time - start_time
print('Total query time:',queryExecTime)
queryTimePerLine = queryExecTime / numPlayLines
print('Query time per line:',queryTimePerLine)

insertPerfSQL = 'INSERT INTO performance (query_type, query_time) VALUES ("READ", %s);'
cur.execute(insertPerfSQL, queryTimePerLine)

myConnection.commit()