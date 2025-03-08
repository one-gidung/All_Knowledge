--MWS라는 유저에게 [회원테이블] 권한 부여
GRANT SELECT, INSERT, UPDATE, DELETE ON [회원테이블] TO MWS WITH GRANT OPTION
-- WITH GRANT OPRION : GRANT 기능도 부여함, 부여받은 기능하에서 본인이 다른 사용자에게 부여 가능

--MWS라는 유저에게 [회원테이블] 권한 제거
REVOKE SELECT, INSERT, UPDATE, DELETE ON [회원테이블] TO MWS CASCADE
-- CASCADE : 유저가 부여한 권한까지 연쇄적으로 모두 제거