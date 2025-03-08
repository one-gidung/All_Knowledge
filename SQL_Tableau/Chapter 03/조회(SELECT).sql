USE EDU

SELECT *
FROM [Member]

-- gender�� man���θ� ���͸�
SELECT *
FROM MEMBER
WHERE GENDER='MAN'

--������ ���ڸ�, ADDR�÷����� ȸ���� ����
SELECT ADDR, COUNT(MEM_NO) AS ȸ��������
FROM MEMBER
WHERE GENDER='MAN'
GROUP BY ADDR

--gender ���� man�ΰ͸�
--group by�� addr, gender ��������
SELECT ADDR, GENDER, COUNT(MEM_NO) AS ȸ��������
FROM MEMBER
WHERE GENDER='MAN'
GROUP BY ADDR, GENDER
-- WHERE ���� MAN ���͸��� ���� ����Ǿ� GOURP�� GENDER�� ������� MAN�ۿ� �� ���´�.

-- GENDER=MAN
-- �׷��� ADDR ����
-- HAVING : ADDR�÷����� ȸ������ 50 �̻� ���͸�
SELECT ADDR, COUNT(MEM_NO) AS ȸ��������
FROM MEMBER
WHERE GENDER='MAN'
GROUP BY ADDR
HAVING COUNT(MEM_NO)>=50

--���̺� MEMBER����
--GENDER�� MAN��
--ADDR �÷����� ȸ��������
--ADDR �÷����� ȸ���� 50 �̻�
--ADDR �÷����� ȸ���� ���� ������ ����
SELECT ADDR, COUNT(MEM_NO) AS ȸ��������
FROM MEMBER
WHERE GENDER='MAN'
GROUP BY ADDR
HAVING COUNT(MEM_NO)>=50
ORDER BY COUNT(MEM_NO) DESC