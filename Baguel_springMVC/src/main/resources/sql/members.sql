--CREATE TABLE b_member (
--    id VARCHAR2(20) NOT NULL PRIMARY KEY, --1
--    pwd VARCHAR2(20) NOT NULL, --2
--    name VARCHAR2(20) NOT NULL, --3
--    nickname VARCHAR2(20) NOT NULL, --4
--    email VARCHAR2(50) NOT NULL, --5
--    joindate date NOT NULL --6
--);

CREATE TABLE members (
    userId VARCHAR2(20) NOT NULL PRIMARY KEY, --1
    userPw VARCHAR2(20) NOT NULL, --2
    userName VARCHAR2(20) NOT NULL, --3
    userNick VARCHAR2(20) NOT NULL, --4
    userEmail VARCHAR2(50) NOT NULL, --5
    joindate date NOT NULL, --6
    memnum INT, --7
		status CHAR(1) CONSTRAINT members_status_CK CHECK(status IN ('0', '1')) --8(1: 가입 / 0: 탈퇴)
);

CREATE SEQUENCE members_seq
START WITH 1
INCREMENT BY 1
ORDER; --요청 순서로 값을 생성

INSERT INTO members VALUES('user001', 'user001PW!!', '문인기', 'Moon', 'moon@mial.com', '22/11/22', members_seq.nextval, '1');

-- 비밀번호 찾기(변경)
UPDATE members
SET pw = '1234'
WHERE id ='user001';