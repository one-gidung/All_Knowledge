USE EDU --[EDU] 데이터베이스를 사용

--[회원테이블] 생성
CREATE TABLE [회원테이블](
[회원번호] VARCHAR(20) PRIMARY KEY,
[이름] VARCHAR(20),
[성별] VARCHAR(2),
[나이] INT,
[가입금액] MONEY,
[가입일자] DATE NOT NULL,
[수신동의] BIT
)

--[회원테이블]에 [몸무게] 컬럽 추가, 데이터 형식은 REAL
ALTER TABLE [회원테이블] ADD [몸무게] REAL
--REAL은 숫자형으로 FLOAT(24)와 같은 데이터 형식

--[회원테이블]에서 [몸무게] 컬럼 데이터 형식 INT로 변경
ALTER TABLE [회원테이블] ALTER COLUMN [몸무게] INT

--[회원테이블]에 [몸무게] 컬럼 [몸무게(kg)]로 변경
SP_RENAME '[회원테이블].[몸무게]', '몸무게(kg)'

--[회원테이블] 테이블명 [MEMBER]로 변경
SP_RENAME '[회원테이블]', 'MEMBER'

--[MEMBER] 테이블 모든 행 데이터 삭제
TRUNCATE TABLE [MEMBER]

--[MEMBER] 테이블 삭제
DROP TABLE [MEMBER]