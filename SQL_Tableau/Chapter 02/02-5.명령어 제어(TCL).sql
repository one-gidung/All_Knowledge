--BEGIN TRAN -> DELETE -> COMMIT
-- ���� �ݿ��Ǵ� �ڵ�� ���� �� �ϰ� �ּ�ó����
/*
USE EDU

BEGIN TRAN

DELETE FROM ȸ�����̺�

COMMIT
*/


--ROLLBACK ���
USE EDU

BEGIN TRAN

SELECT * FROM ȸ�����̺�

DELETE FROM ȸ�����̺�

SELECT * FROM ȸ�����̺�

ROLLBACK

SELECT * FROM ȸ�����̺�


--SAVEPOINT
--��ȣ ������� �巡���Ͽ� ����
USE EDU --1

BEGIN TRAN --2

/* 3. SAVEPOINT ȸ�����̺� ������ ���� */
SAVE TRAN S1;
INSERT INTO [ȸ�����̺�] VALUES ('A10001', '�����', '��', 33, 100000, '2020-01-01', 1);

/* 4. SAVEPOINT A10001 ���� 34�� ���� */
SAVE TRAN S2;
UPDATE ȸ�����̺� SET ����=34 WHERE ȸ����ȣ='A10001'

/* 5. SAVEPOINT A10003 ������ ���� */
SAVE TRAN S3;
DELETE FROM ȸ�����̺� WHERE ȸ����ȣ='A10003'

SELECT * FROM ȸ�����̺� -- 3~5�� ���� Ȯ��

/* 6. S3 ���� ��� */
ROLLBACK TRAN S3;
SELECT * FROM ȸ�����̺� -- Ȯ��

/* 7. S2 ���� ��� */
ROLLBACK TRAN S2;
SELECT * FROM ȸ�����̺� -- Ȯ��

/* 8. S1 ���� ��� */
ROLLBACK TRAN S1;
SELECT * FROM ȸ�����̺� -- Ȯ��
