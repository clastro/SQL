## Python에서 데이터베이스 handling

#### 접속 정보 생략
```
conn  = pymysql.connect(host=host,port=port,user=user,passwd=passwd,db=db) 
cursor = conn.cursor()
conn.set_charset('utf8')
```

```
user_data = []
for i,j in zip(df['thumbnail'],df['channel_id']):
    user_data.append([i,j])
```
##### [[thumbnail],[channel_id]] 과 같은 데이터 형태를 만들어 준다.

### UPDATE 
```
sql = "UPDATE filtered_condition_17854 SET thumbnail = %s WHERE channel_id = %s;"
cursor.executemany(sql, user_data)
conn.commit()
```
