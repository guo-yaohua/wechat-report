import pymysql
from pymysql.converters import escape_string
import re

conn = pymysql.connect(host='localhost', user='root', password='123456', db='test', charset='utf8mb4', port=3306)

cur = conn.cursor()

with open(r"C:\Users\guoya\Desktop\微信聊天报告\俺们村里最乖的仔\炒酸奶.txt", encoding='utf-8') as f:
    lines = f.readlines()
    filter_lines = []
    reg = "^.+[\u4E00-\u9FFF]\s\(.+\):"

    for line in lines:
        # 去除转发的聊天记录 简单过滤
        if (line.startswith('炒酸奶') or line.startswith('俺们村里最乖的仔')) and re.match(reg, line):
            filter_lines.append(line.strip())

for line in filter_lines:
    s1 = line.find(" ")
    s2 = line.find("):")
    name = line[:s1]
    time = line[s1 + 2:s2]
    content = line[s2 + 2:]
    print(line)
    insert_sql = f"INSERT INTO log(user,datetime,content) VALUES ('{name}','{time}' ,'{escape_string(content)}')"
    cur.execute(insert_sql)
conn.commit()
