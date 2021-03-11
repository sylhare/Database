#!/usr/bin/python

import pymysql
import time

myConnection = pymysql.connect(host='localhost', user='root', passwd='password', db='shakespeare')
cur = myConnection.cursor()

with open('characters.txt') as char:
	charList = char.read().splitlines()
curChar = 'Unknown'

start_time = time.time()

createSQL = 'INSERT INTO amnd (char_name, play_text) VALUES (%s, %s);'
	
with open('A_Midsummer_Nights_Dream.txt','r') as playlines:
	for line in playlines:
		if line.upper().strip() in charList:
			curChar = line.strip()
			print('Changing character to',line.strip())
		else:
			sql_values = curChar, line.strip()
			print('Writing line \"' + line.strip() + '\"')
			cur.execute(createSQL,sql_values)
			
myConnection.commit()

end_time = time.time()
cur.execute('SELECT COUNT(line_number) FROM amnd;')
numPlayLines = cur.fetchall()[0][0]
print(numPlayLines,'rows')

queryExecTime = end_time - start_time
print('Total query time:',queryExecTime)
queryTimePerLine = queryExecTime / numPlayLines
print('Query time per line:',queryTimePerLine)

insertPerfSQL = 'INSERT INTO performance (query_type, query_time) VALUES ("CREATE", %s);'
cur.execute(insertPerfSQL, queryTimePerLine)

myConnection.commit()
myConnection.close()