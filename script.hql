CREATE TABLE table_oslavych (
    index INT,
    age INT,
    gender INT,
    height INT,
    weight FLOAT,
    ap_hi INT,
    ap_lo INT,
    cholesterol INT,
    gluc INT,
    smoke INT,
    alco INT,
    active INT,
    cardio INT
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\;'
STORED AS TEXTFILE;
LOAD DATA LOCAL INPATH 'bootcamp5.csv' INTO TABLE table_oslavych;

-- task 1
SELECT 
    active,
    AVG(weight) AS avg_weight
FROM 
    table_oslavych
GROUP BY 
    active;

-- task 2

SELECT 
    (SUM(CASE WHEN alco = 1 THEN 1 ELSE 0 END) * 100.0) / COUNT(*) AS percentage_alco
FROM 
    table_oslavych
WHERE 
    gender = 2 AND gluc = 1 AND cholesterol = 1;
