USE EDU --[EDU] �����ͺ��̽��� ���

--[ȸ�����̺�] ����
CREATE TABLE [ȸ�����̺�](
[ȸ����ȣ] VARCHAR(20) PRIMARY KEY,
[�̸�] VARCHAR(20),
[����] VARCHAR(2),
[����] INT,
[���Աݾ�] MONEY,
[��������] DATE NOT NULL,
[���ŵ���] BIT
)

--[ȸ�����̺�]�� [������] �÷� �߰�, ������ ������ REAL
ALTER TABLE [ȸ�����̺�] ADD [������] REAL
--REAL�� ���������� FLOAT(24)�� ���� ������ ����

--[ȸ�����̺�]���� [������] �÷� ������ ���� INT�� ����
ALTER TABLE [ȸ�����̺�] ALTER COLUMN [������] INT

--[ȸ�����̺�]�� [������] �÷� [������(kg)]�� ����
SP_RENAME '[ȸ�����̺�].[������]', '������(kg)'

--[ȸ�����̺�] ���̺�� [MEMBER]�� ����
SP_RENAME '[ȸ�����̺�]', 'MEMBER'

--[MEMBER] ���̺� ��� �� ������ ����
TRUNCATE TABLE [MEMBER]

--[MEMBER] ���̺� ����
DROP TABLE [MEMBER]