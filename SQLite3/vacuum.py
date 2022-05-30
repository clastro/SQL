# Python에서 sqlite3 용량 확보하기
import sqlite3
conn = sqlite3.connect('/filename.db', isolation_level=None)
conn.execute("VACUUM")
conn.close()
