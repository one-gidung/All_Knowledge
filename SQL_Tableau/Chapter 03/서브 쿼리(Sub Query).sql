USE EDU

-- SELECT절에 사용되는 서브 쿼리
SELECT *
		,(SELECT gender
		FROM [Member] B
		WHERE A.mem_no = B.mem_no) AS gender
FROM [Order] A

/* 
- SELECT절에 사용되는 서브 쿼리는 하나의 열처럼 사용되며, 이를 스칼라(Scala) 서브 쿼리라고도 합니다.
: 스칼라는 한 번에 하나의 값만 보유할 수 있는 원자량
- 조인의 대체 표현식이지만, 데이터 양이 많을수록 실행 속도가 느려 거의 사용되지 않음.
*/

-- FROM절에 사용되는 서브 쿼리
SELECT *
FROM (
	SELECT mem_no
			, SUM(sales_amt) AS tot_amt
	FROM [Order]
	GROUP BY mem_no
	)A

/*
- FROM절에 사용되는 서브 쿼리는 테이블처럼 사용되며, 인라인 뷰(Inline View) 서브 쿼리라 함
- 테이블처럼 사용되기 때문에, 열 이름과 테이블 명을 명시해야 함
*/

-- [Member] 및 [Order] 테이블 공통 값(mem_no) 결합
-- 1:1 관계
SELECT  *
FROM (
		SELECT mem_no
				, SUM(SALES_AMT) AS TOT_AMT
		FROM [Order]
		GROUP BY mem_no
	)A
LEFT JOIN [Member] B
ON A.mem_no = B.mem_no


-- WHERE절 뒤에 위치한 쿼리는 일반 서브 쿼리라고 한다. 종류는 2가지 (단일 행, 다중 행)
-- WHERE절에 사용되는 서브 쿼리(단일 행 서브 쿼리)
-- 단일 행 : 서브 쿼리 결과가 단일 행
SELECT *
FROM [Order]
WHERE mem_no = (SELECT mem_no FROM [Member] WHERE mem_no = '1000005')

-- 단일 행 확인
SELECT mem_no FROM [Member] WHERE mem_no = '1000005'

-- WHERE절에 사용되는 서브 쿼리(다중 행 서브 쿼리)
-- 다중 행 : 서브 쿼리 결과가 여러 행
SELECT *
FROM [Order]
WHERE mem_no IN (SELECT mem_no FROM [Member] WHERE gender = 'man')

-- 여러 행 확인
SELECT mem_no FROM [Member] WHERE gender = 'man'

-- WHERE절에 사용된 'IN'은 리스트의 값 중 하나라도 일치하면 되는 특수 연산자이다.