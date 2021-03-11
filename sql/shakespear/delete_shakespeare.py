#!/usr/bin/python

import pymysql
import time

myConnection = pymysql.connect(host='localhost', user='root', passwd='password', db='shakespeare')
cur = myConnection.cursor()

start_time = time.time()	

cur.execute('SELECT COUNT(line_number) FROM amnd;')
numPlayLinesBeforeDelete = cur.fetchall()[0][0]

print('Deleting lines...')
cur.execute('DELETE FROM amnd WHERE play_text RLIKE "^enter|^exit|^act|^scene|^exeunt";')
myConnection.commit()

end_time = time.time()
cur.execute('SELECT COUNT(line_number) FROM amnd;')
numPlayLinesAfterDelete = cur.fetchall()[0][0]

numPlayLinesDeleted = numPlayLinesBeforeDelete - numPlayLinesAfterDelete
print(numPlayLinesDeleted,'rows')

queryExecTime = end_time - start_time
print('Total query time:',queryExecTime)
queryTimePerLine = queryExecTime / numPlayLinesDeleted
print('Query time per line:',queryTimePerLine)

insertPerfSQL = 'INSERT INTO performance (query_type, query_time) VALUES ("DELETE", %s);'
cur.execute(insertPerfSQL, queryTimePerLine)

myConnection.commit()