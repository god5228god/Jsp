SELECT USER
FROM DUAL;
--==>> SCOTT

--○ 기존 테이블 제거
DROP TABLE TBL_BOARD PURGE;
--==>> Table TBL_BOARD이(가) 삭제되었습니다.

--○ 실습 테이블 생성(게시판 전용 테이블)
-- 테이블명: TBL_BOARD
CREATE TABLE TBL_BOARD                   
( NUM       NUMBER(9)       NOT NULL                    -- 게시물 번호
, NAME      VARCHAR2(30)    NOT NULL                    -- 게시물 작성자
, PWD       VARCHAR2(20)    NOT NULL                    -- 게시물 패스워드
, EMAIL     VARCHAR2(50)                                -- 작성자 이메일
, SUBJECT   VARCHAR2(100)   NOT NULL                    -- 게시물 제목
, CONTENT   VARCHAR2(4000)  NOT NULL                    -- 게시물 내용
, IPADDR    VARCHAR2(20)                                -- 접속한 클라이언트 IP 주소
, HITCOUNT  NUMBER          DEFAULT 0       NOT NULL    -- 게시물 조회수
, CREATED   DATE            DEFAULT SYSDATE NOT NULL    -- 게시물 작성일
, CONSTRAINT BOARD_NUM_PK PRIMARY KEY(NUM)
);
-->> 생성 완

--○ 게시물 번호의 최대값을 얻어내는 쿼리문 구성
SELECT NVL(MAX(NUM), 0) AS MAXNUM FROM TBL_BOARD
;

--○ 게시물 작성 쿼리문 구성
INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT
, IPADDR, HITCOUNT, CREATED)
 VALUES(1, '임유훤', '1234', 'ufunny@google.com', '작성테스트', '게시물 내용을 작성했습니다.', '192.168.0.109', 0, SYSDATE);
 
 
INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, CREATED) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)
;

-- 확인
SELECT * 
FROM TBL_BOARD;

--○ 커밋
COMMIT;
-->> 커밋 완

--○ 레코드의 갯수를 가져오는 쿼리문 구성
SELECT COUNT(*) AS COUNT FROM TBL_BOARD
;
-->> 1
--                  11 ~ 20
--○ 특정 영역(시작번호~끝번호)의 게시물 목록을 읽어오는 쿼리문 구성
--   번호, 작성자, 제목, 조회수, 작성일
-- 전체 번호를 10개씩 끊는다고 가정하면 (만약 33건의 데이터가 있음)
-- NUM/10 이면 페이지 넘버가 되고(올림처리) 4페이지가 나옴
-- 페이지 넘버를 요청하면 4페이지 요청시 NUM%(페이지번호-1) = 3
-- 3페이지 요청시(4~13) (NUM/(페이지번호-1))+1 33/2 = 13 
SELECT NUM, NAME, SUBJECT, HITCOUNT, CREATED
FROM (
SELECT ROWNUM AS RNUM, DATA.*
FROM(
    SELECT NUM, NAME, SUBJECT, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED
    FROM TBL_BOARD
    ORDER BY NUM DESC
) DATA
)
WHERE RNUM>=11 AND RNUM<=20;

-- 한 줄 구성
SELECT NUM, NAME, SUBJECT, HITCOUNT, CREATED FROM (SELECT ROWNUM AS RNUM, DATA.* FROM(SELECT NUM, NAME, SUBJECT, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED FROM TBL_BOARD ORDER BY NUM DESC) DATA) WHERE RNUM>=1 AND RNUM<=10
;



--○ 특정 게시물 조회에 따른 조회 횟수 증가 쿼리문 구성
UPDATE TBL_BOARD SET HITCOUNT = HITCOUNT+1 WHERE NUM = ?
;
-- 실무적 → 로그화! 


--○ 특정 게시물의 내용을 읽어오는 쿼리문 구성
SELECT NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, IPADDR, HITCOUNT, TO_CHAR(CREATED,'YYYY-MM-DD') AS CREATED FROM TBL_BOARD WHERE NUM = ?
;


--○ 특정 게시물을 삭제하는 쿼리문 구성
DELETE FROM TBL_BOARD WHERE NUM = 1
;

-- 롤백
ROLLBACK;

SELECT *
FROM TBL_BOARD;

--○ 특정 게시물을 수정하는 쿼리문 구성
-- (게시물 상세보기 페이지 내에서의 처리)
-- 수정 가능 항목: 작성자, 패스워드, 이메일, 제목, 내용
UPDATE TBL_BOARD SET NAME='임유훤', PWD='12345', EMAIL='ufunny@google.com', SUBJECT='수정한 제목', CONTENT='게시물 내용을 수정했습니다.' WHERE NUM = 1
;
-- 한 줄 구성
UPDATE TBL_BOARD SET NAME=?, PWD=?, EMAIL=?, SUBJECT=?, CONTENT=? WHERE NUM = ?
;

--○ 커밋
COMMIT;
-- 커밋완

--○ 특정 게시물(50)의 다음 번호의 게시물 번호를 읽어오는 쿼리문 구성
--   SELECT NUM
--   FROM(
--   SELECT DATA2.RNUM, DATA.*
--   FROM
--   ( 
--        SELECT ROWNUM RNUM, DATA.*
--        FROM 
--        ( SELECT *
--                FROM TBL_BOARD
--                ORDER BY NUM DESC
--        ) DATA
--    ) DATA2
--    WHERE NUM = 1
--    ) WHERE DATA2.RNUM = DATA.RNUM+1;
--    

    
    
    SELECT NEXT_NUM
    FROM (
    SELECT NUM
    , LAG(NUM,1, 0) OVER (ORDER BY NUM DESC) AS NEXT_NUM
    FROM TBL_BOARD
    )
    WHERE NUM = 1;

-- 한줄 구성
SELECT NVL(MIN(NUM), -1) NEXTNUM FROM TBL_BOARD WHERE NUM>50
;

--○ 특정 게시물의 이전 번호의 게시물 번호를 읽어오는 쿼리문 구성
 SELECT PREV_NUM
    FROM (
    SELECT NUM
    , LEAD(NUM,1, 0) OVER (ORDER BY NUM DESC) AS PREV_NUM
    FROM TBL_BOARD
    )
    WHERE NUM = 1;

-- 한줄 구성
SELECT NVL(MAX(NUM), -1) BEFORENUM FROM TBL_BOARD WHERE NUM<50
;


--○ 

--○ 




















