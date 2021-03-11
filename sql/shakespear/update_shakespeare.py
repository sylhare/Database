#!/usr/bin/python

import pymysql
import time

myConnection = pymysql.connect(host='localhost', user='root', passwd='password', db='shakespeare')
cur = myConnection.cursor()

start_time = time.time()	

updateSQL = 'UPDATE amnd SET play_text = REPLACE(play_text, %s, %s);'	
	
with open('characters.txt','r') as char:
	for character in char.read().splitlines():
		print('Capitalizing occurances of ' + character + '...')
		updateStrings = character.capitalize(), character.upper()
		cur.execute(updateSQL, updateStrings)

myConnection.commit()

end_time = time.time()
cur.execute('SELECT COUNT(line_number) FROM amnd;')
numPlayLines = cur.fetchall()[0][0]
print(numPlayLines,'rows')

queryExecTime = end_time - start_time
print('Total query time:',queryExecTime)
queryTimePerLine = queryExecTime / numPlayLines
print('Query time per line:',queryTimePerLine)

insertPerfSQL = 'INSERT INTO performance (query_type, query_time) VALUES ("UPDATE", %s);'
cur.execute(insertPerfSQL, queryTimePerLine)

myConnection.commit()