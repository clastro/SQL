import pandas as pd
import numpy as np
import pymysql

conn  = pymysql.connect(host=host,port=port,user=user,passwd=passwd,db=db)  #데이터베이스 연결
cursor = conn.cursor()

df_channel = pd.DataFrame(cursor.fetchall(),columns=[item[0] for item in cursor.description])

df = pd.read_csv('../Statistics/Hifen_Score/channel_senti_score_real.csv',encoding='utf-8-sig')

user_data = []
for i,j in zip(df['score'],df['channel_id']):
    user_data.append([i,j])

# UPDATE 
sql = "UPDATE YT_hifen_score SET EC_Positivity_100 = %s WHERE channel_id = %s;"
cursor.executemany(sql, user_data)
conn.commit()
    
