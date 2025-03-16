USE EDU

-- SELECT���� ���Ǵ� ���� ����
SELECT *
		,(SELECT gender
		FROM [Member] B
		WHERE A.mem_no = B.mem_no) AS gender
FROM [Order] A

/* 
- SELECT���� ���Ǵ� ���� ������ �ϳ��� ��ó�� ���Ǹ�, �̸� ��Į��(Scala) ���� ������� �մϴ�.
: ��Į��� �� ���� �ϳ��� ���� ������ �� �ִ� ���ڷ�
- ������ ��ü ǥ����������, ������ ���� �������� ���� �ӵ��� ���� ���� ������ ����.
*/

-- FROM���� ���Ǵ� ���� ����
SELECT *
FROM (
	SELECT mem_no
			, SUM(sales_amt) AS tot_amt
	FROM [Order]
	GROUP BY mem_no
	)A

/*
- FROM���� ���Ǵ� ���� ������ ���̺�ó�� ���Ǹ�, �ζ��� ��(Inline View) ���� ������ ��
- ���̺�ó�� ���Ǳ� ������, �� �̸��� ���̺� ���� ����ؾ� ��
*/

-- [Member] �� [Order] ���̺� ���� ��(mem_no) ����
-- 1:1 ����
SELECT  *
FROM (
		SELECT mem_no
				, SUM(SALES_AMT) AS TOT_AMT
		FROM [Order]
		GROUP BY mem_no
	)A
LEFT JOIN [Member] B
ON A.mem_no = B.mem_no


-- WHERE�� �ڿ� ��ġ�� ������ �Ϲ� ���� ������� �Ѵ�. ������ 2���� (���� ��, ���� ��)
-- WHERE���� ���Ǵ� ���� ����(���� �� ���� ����)
-- ���� �� : ���� ���� ����� ���� ��
SELECT *
FROM [Order]
WHERE mem_no = (SELECT mem_no FROM [Member] WHERE mem_no = '1000005')

-- ���� �� Ȯ��
SELECT mem_no FROM [Member] WHERE mem_no = '1000005'

-- WHERE���� ���Ǵ� ���� ����(���� �� ���� ����)
-- ���� �� : ���� ���� ����� ���� ��
SELECT *
FROM [Order]
WHERE mem_no IN (SELECT mem_no FROM [Member] WHERE gender = 'man')

-- ���� �� Ȯ��
SELECT mem_no FROM [Member] WHERE gender = 'man'

-- WHERE���� ���� 'IN'�� ����Ʈ�� �� �� �ϳ��� ��ġ�ϸ� �Ǵ� Ư�� �������̴�.