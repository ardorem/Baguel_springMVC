CREATE TABLE COMMENTS (
    commentNum INT NOT NULL PRIMARY KEY,--1
    parentComment INT DEFAULT 0 NOT NULL ,
    boardNum INT NOT NULL ,--2
    writeDate VARCHAR2(20) NOT NULL,
    content VARCHAR2(1500) NOT NULL,--9
    userId VARCHAR2(20) NOT NULL,
    isEdited CHAR(1) NOT NULL CONSTRAINT COMMENTS_isEdited_CK CHECK(isEdited IN ('0', '1')),
    commentType CHAR(1) NOT NULL CONSTRAINT COMMENTS_commentType_CK CHECK(commentType IN ('1', '2')),
    status CHAR(1) CONSTRAINT comments_status_CK CHECK(status IN ('0', '1')) --(1: 삭제되지 않음 / 0: 삭제됨)
--    CONSTRAINT FK_COMMENTS_ID FOREIGN KEY(ID)
--    REFERENCES MEMBERS(ID),
--    
--    CONSTRAINT FK_BOARD_NUM FOREIGN KEY(BOARD_NUM)
--    REFERENCES BOARD(BOARDNUM)
);

CREATE SEQUENCE COMMENT_NUM_seq
START WITH 1
INCREMENT BY 1
ORDER; --요청 순서로 값을 생성

-- table num 1에 테스트 데이터 삽입
INSERT INTO COMMENTS VALUES(COMMENT_NUM_seq.nextval, 0, 1, TO_char(SYSDATE,'YYYY-MM-DD HH24:MI'),'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ea odio porro fuga libero tenetur similique. Quis inventore officiis iure quo, fugiat, cum delectus earum id nihil tempore provident neque tenetur?','user001', '1', '1', '1');
INSERT INTO COMMENTS VALUES(COMMENT_NUM_seq.nextval, 1, 1, TO_char(SYSDATE,'YYYY-MM-DD HH24:MI'),'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ea odio porro fuga libero tenetur similique. Quis inventore officiis iure quo, fugiat, cum delectus earum id nihil tempore provident neque tenetur?','user002', '1', '2', '1');
INSERT INTO COMMENTS VALUES(COMMENT_NUM_seq.nextval, 1, 1, TO_char(SYSDATE,'YYYY-MM-DD HH24:MI'),'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ea odio porro fuga libero tenetur similique. Quis inventore officiis iure quo, fugiat, cum delectus earum id nihil tempore provident neque tenetur?','user001', '0', '2', '0');
INSERT INTO COMMENTS VALUES(COMMENT_NUM_seq.nextval, 0, 1, TO_char(SYSDATE,'YYYY-MM-DD HH24:MI'),'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ea odio porro fuga libero tenetur similique. Quis inventore officiis iure quo, fugiat, cum delectus earum id nihil tempore provident neque tenetur?','user004', '1', '1', '1');
INSERT INTO COMMENTS VALUES(COMMENT_NUM_seq.nextval, 1, 1, TO_char(SYSDATE,'YYYY-MM-DD HH24:MI'),'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ea odio porro fuga libero tenetur similique. Quis inventore officiis iure quo, fugiat, cum delectus earum id nihil tempore provident neque tenetur?','user001', '1', '2', '0');

-- 불러오기 (parent)
SELECT commentNum, parentComment, boardNum, writeDate, content, id, isEdited, status FROM comments WHERE boardNum = '11' AND commentType = '1' ORDER BY commentnum;

-- 불러오기 (child)
SELECT commentNum, parentComment, boardNum, writeDate, content, id, isEdited, status FROM comments WHERE boardNum = '11' AND commentType = '2' ORDER BY commentnum;

-- edit comment
Update comments SET content = 'test', isEdited = '1' WHERE commentNum='7';

-- add comment
INSERT INTO COMMENTS VALUES(COMMENT_NUM_seq.nextval, 1, 0, TO_char(SYSDATE,'YYYY-MM-DD HH24:MI'),'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ea odio porro fuga libero tenetur similique. Quis inventore officiis iure quo, fugiat, cum delectus earum id nihil tempore provident neque tenetur?','user001', '0', '1', '0');

-- add child comment
INSERT INTO COMMENTS VALUES(COMMENT_NUM_seq.nextval, 1, 1, TO_char(SYSDATE,'YYYY-MM-DD HH24:MI'),'Lorem ipsum dolor sit amet consectetur adipisicing elit. Ea odio porro fuga libero tenetur similique. Quis inventore officiis iure quo, fugiat, cum delectus earum id nihil tempore provident neque tenetur?','user001', '0', '2', '0');

-- deactivate comment
UPDATE comments SET status=0 WHERE commentnum=7;


select LENGTHB(CONTENT) BYTE
from COMMENTS; -- 바이트 수 검사


DROP TABLE COMMENTS;
drop sequence COMMENT_NUM_seq;