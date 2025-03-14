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
FROM [Member] A		-- AS ��������
LEFT JOIN [Order] B
ON A.mem_no = B.mem_no

-- RIGHT JOIN
SELECT *
FROM [Member] A
RIGHT JOIN [Order] B
ON A.mem_no = B.mem_no
-- �� ������ ��ȸ�� �ֹ��� ���ٰ� �����Ͽ��⿡
-- NULL ���� ��ȸ���� ����

-- FULL JOIN
SELECT *
FROM [Member] A
FULL JOIN [Order] B
ON A.mem_no = B.mem_no

/* OTHER JOIN (CROSS, SELF) */
-- CROSS JOIN (���� �ٸ� �� ���̺�)
SELECT *
FROM [Member] A
CROSS 
JOIN [Order] B
WHERE A.mem_no = '1000001'

-- SELF JOIN (�� ���̺� ������)
SELECT *
FROM [Member] A, [Member] B
WHERE A.mem_no = '1000001'