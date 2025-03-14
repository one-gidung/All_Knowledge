USE EDU

/* INNER JOIN */
SELECT *
FROM [Member] AS A
INNER
JOIN [Order] AS B
ON A.MEM_NO = B.MEM_NO

/* OUTER JOIN */
-- LEFT JOIN
SELECT *
FROM [Member] A		-- AS 생략가능
LEFT JOIN [Order] B
ON A.mem_no = B.mem_no

-- RIGHT JOIN
SELECT *
FROM [Member] A
RIGHT JOIN [Order] B
ON A.mem_no = B.mem_no
-- 본 예제는 비회원 주문은 없다고 가정하였기에
-- NULL 값이 조회되지 않음

-- FULL JOIN
SELECT *
FROM [Member] A
FULL JOIN [Order] B
ON A.mem_no = B.mem_no

/* OTHER JOIN (CROSS, SELF) */
-- CROSS JOIN (서로 다른 두 테이블)
SELECT *
FROM [Member] A
CROSS 
JOIN [Order] B
WHERE A.mem_no = '1000001'

-- SELF JOIN (한 테이블 내에서)
SELECT *
FROM [Member] A, [Member] B
WHERE A.mem_no = '1000001'