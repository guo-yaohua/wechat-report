-- 删除统计外日期
DELETE
FROM log
WHERE datetime < '2020-01-01';

-- 验证日期是否删除正确
SELECT MIN(datetime)
FROM log;

-- 获取最晚说的话
SELECT id, user, content, datetime, DATE_FORMAT(datetime, '%H') AS h
FROM log
WHERE DATE_FORMAT(datetime, '%H') <= 5
ORDER BY h DESC, datetime;

-- 关键字
SELECT id, user, content, datetime
FROM log
WHERE content LIKE '%爱你%';

SELECT id, content, datetime
FROM log
WHERE content LIKE '%想你%';

SELECT id, content, datetime
FROM log
WHERE content LIKE '%喜欢你%';

SELECT id, content, datetime
FROM log
WHERE content LIKE '%吃什么%';

SELECT id, content, datetime
FROM log
WHERE content LIKE '%晚安%';

SELECT id, content, datetime
FROM log
WHERE content LIKE '%哈%';

SELECT COUNT(1)
FROM log
WHERE content LIKE '%哈%';

-- 按月分组
SELECT COUNT(id), DATE_FORMAT(datetime, '%m') AS m
FROM log
GROUP BY m;

-- 按小时分组
SELECT COUNT(id), DATE_FORMAT(datetime, '%H') AS m
FROM log
GROUP BY m;