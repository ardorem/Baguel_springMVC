CREATE TABLE PLACES (
    place VARCHAR2(20) NOT NULL PRIMARY KEY, --1 서울 시립 미술관
    placeName VARCHAR2(30) NOT NULL,
    lat VARCHAR2(20) NOT NULL,
    lng VARCHAR2(20) NOT NULL,
    xy VARCHAR2(10) NOT NULL
);

INSERT INTO places values('gBpalace', '경복궁', '37.579381', '126.976851', '60_127');
INSERT INTO places values('cDpalace', '창덕궁', '37.579364', '126.990823', '60_127');
INSERT INTO places values('cGpalace', '창경궁', '37.578881', '126.995014', '60_127');
INSERT INTO places values('dSpalace', '덕수궁', '37.565808', '126.975210', '60_127');
INSERT INTO places values('gBpalace', '경복궁', '37.579381', '126.976851', '60_127');
INSERT INTO places values('sema', '서울 시립미술관', '37.564111', '126.973841', '60_127');
INSERT INTO places values('cGarden', '서울 어린이 대공원', '37.427562', '127.017022', '62_126');

-- 모든 장소 데이터
SELECT *
FROM places;

-- 모든 단기 예보 좌표(중복 제거)
SELECT xy
FROM places
GROUP BY xy;