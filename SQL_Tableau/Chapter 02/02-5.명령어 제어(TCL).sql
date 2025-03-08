--BEGIN TRAN -> DELETE -> COMMIT
-- 실제 반영되는 코드라 실행 안 하고 주석처리함
/*
USE EDU

BEGIN TRAN

DELETE FROM 회원테이블

COMMIT
*/


--ROLLBACK 기능
USE EDU

BEGIN TRAN

SELECT * FROM 회원테이블

DELETE FROM 회원테이블

SELECT * FROM 회원테이블

ROLLBACK

SELECT * FROM 회원테이블


--SAVEPOINT
--번호 순서대로 드래그하여 실행
USE EDU --1

BEGIN TRAN --2

/* 3. SAVEPOINT 회원테이블에 데이터 삽입 */
SAVE TRAN S1;
INSERT INTO [회원테이블] VALUES ('A10001', '모원서', '남', 33, 100000, '2020-01-01', 1);

/* 4. SAVEPOINT A10001 나이 34로 수정 */
SAVE TRAN S2;
UPDATE 회원테이블 SET 나이=34 WHERE 회원번호='A10001'

/* 5. SAVEPOINT A10003 데이터 삭제 */
SAVE TRAN S3;
DELETE FROM 회원테이블 WHERE 회원번호='A10003'

SELECT * FROM 회원테이블 -- 3~5번 실행 확인

/* 6. S3 지정 취소 */
ROLLBACK TRAN S3;
SELECT * FROM 회원테이블 -- 확인

/* 7. S2 지정 취소 */
ROLLBACK TRAN S2;
SELECT * FROM 회원테이블 -- 확인

/* 8. S1 지정 취소 */
ROLLBACK TRAN S1;
SELECT * FROM 회원테이블 -- 확인
