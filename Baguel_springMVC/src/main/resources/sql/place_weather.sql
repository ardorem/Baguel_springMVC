CREATE TABLE PLACE_WEATHER (
    xy VARCHAR2(10) NOT NULL, --1 서울 시립 미술관
    fcstDate VARCHAR2(10) NOT NULL, --2 20230305
    avgTemp VARCHAR2(10) NOT NULL, --3 -2
    precipitation VARCHAR2(10) NOT NULL, --4 0
    inputDate VARCHAR2(20) NOT NULL, --5 20230304
    
    CONSTRAINT place_pk PRIMARY KEY(xy, fcstDate)
);

-- Data sample
INSERT INTO place_weather VALUES('서울 시립 미술관', '20230122', -1, 10, 20230121);
INSERT INTO place_weather VALUES('경복궁', '20230122', -1, 10, 20230121);
INSERT INTO place_weather VALUES('서울 시립 미술관', '20230123', -3, 0, 2023121);
INSERT INTO place_weather VALUES('경복궁', '20230123', -4, 10, 20230121);

-- SELECT Sample
SELECT AVG_TEMP, precipitation
FROM PLACE_WEATHER
WHERE place = '경복궁'AND fcstDate = '20230122';

drop table place_weather;

CREATE TABLE PLACE (
		placeCode VARCHAR2(20) NOT NULL PRIMARY KEY, --1 sema
    placeName VARCHAR2(50) NOT NULL, --2 서울 시립 미술관
    xy VARCHAR2(10) NOT NULL --3 20230305
);