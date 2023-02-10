<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="css/header_footer.css">
  <link rel="stylesheet" href="css/srch_station.css">
  <title>바글</title>
</head>

<body>
  <div id="container">
    <!-- ****************************************************************************** header & nav start-->
    <header>
      <a href="main" id="logo">
        <p>바글🚶‍♂️🚶🚶‍♀️</p>
        <div id="logoSmall">서울 주요지역 혼잡 예측 서비스</div>
      </a>
      <div id="loginMenu">
		<c:choose>
			<c:when test="${userLogin eq 'logined' }">
				${userId }&nbsp;&nbsp;
				<a href="mypage">마이페이지</a>
				<a href="logout">로그아웃</a>
			</c:when>
			<c:otherwise>
	      <a href="register">회원가입</a>
				<a href="login">로그인</a>
			</c:otherwise>
		</c:choose>
		</div>
    </header>
    <nav>
      <ul id="navi">
        <li><a href="#">혼잡 예측</a>
          <ul>
            <li><a href="srch_station">역으로 조회</a></li>
            <li><a href="srch_place">장소로 조회</a></li>
          </ul>
        </li>
        <li><a href="cal_view">달력으로 조회</a>
          <ul>
            <li><a href="cal_view">달력으로 조회</a></li>
            <li><a href="cal_add">일정 등록 요청</a></li>
            <li><a href="cal_list">요청된 일정</a></li>
          </ul>
        </li>
        <li><a href="map">지도로 조회</a></li>
        <li><a href="#">이용 안내</a>
          <ul>
            <li><a href="about">about 바글</a></li>
          </ul>
        </li>
      </ul>
    </nav>
    <!-- ************************************************************************* header & nav end -->

    <!-- ******************************************************************************main start -->
    <main>
      <div id="mainTitleUser">
        <h1>지하철역으로 조회</h1>
      </div>


      <!-- <div id="search"> -->


      <form id="search" actoin="result_station.html" method="get">
        <!--후에 form태그로 변경하기-->

        <div id="wrapper">
          <div id="selectDate">
            <h4>날짜 선택</h4>
            <input type="date" class="cal" required placeholder="날짜 선택">
          </div>

          <div id="selectPlace">
            <h4>장소 선택</h4>
            <input type="text" placeholder="조회할 지하철역을 선택하세요.">
            <!-- <img src="images/search.png" alt="검색" onclick="location.href='information.html'">
          <input type="image" onclick="location.href='information.html'" src="Images/search.png" alt="검색"> -->
          </div>

          <div>
            <button id="searchIcon" type="submit" name="click" onclick="location.href='result_station.html'">
              <img id="btnimg" src="images/search.png"></button>
          </div>

          <div id="bestStation">
            <h4>인기지하철역</h4>
            <ol>
              <li>강남역</li> <!-- 1 -->
              <li>잠실역</li>
              <li>고속터미널역</li>
              <li>서울역</li>
              <li>홍대입구역</li> <!-- 5 -->
              <li>선릉역</li>
              <li>신림역</li>
              <li>사당역</li>
              <li>구로디지털단지역</li>
              <li>가산디지털단지역</li> <!-- 10 -->
            </ol>
          </div>

          <div id="subwayLinemap">
            <!-- <div id="mapImg" style='position:relative;width:500px'><a
          href="http://map.kakao.com/?REGION=01&STARTNAME=&ENDNAME=&STARTID=&ENDID=&URLLINK=true&target=subway" target="_blank"><img src="http://map.kakao.com/subway/linemap/preview/seoul.gif" width="498" height="400" border="0" style="border:1px solid #ccc"></a><div class="tpText" style="background:url(//t1.daumcdn.net/localimg/localimages/07/2007/map/2007/arrow_yl.gif) 7px 9px no-repeat; background-color:#000; position:absolute; top:0px; left:0px; opacity:0.7; filter:alpha(opacity=70); width:100%; padding:5px 0 3px 0; color:#fff; font-size:12px; font-family:돋움; word-break:break-all; overflow:hidden; line-height:17px;text-indent:15px;'">아래를 클릭하시면, <span style='color:#ffc228'><b></b></span>수도권 지하철 노선도를 크게 보실 수 있습니다.</div></div>
        <div> -->
            <h4>지하철노선도</h4>
            <img id="subwayImg" src="images/subway.png">
          </div>

        </div>
      </form>


      <!-- </div> -->


    </main>
    <!-- ************************************************************************ main -->

    <!-- ******************************************************************************footer start -->
    <footer>
      <div id="bottomMenu">
        <ul>
          <li><a href="#">회사 소개</a></li>
          <li><a href="#">개인정보처리방침</a></li>
          <li><a href="#">이용약관</a></li>
          <li><a href="#">사이트맵</a></li>
        </ul>
        <div id="sns">
          <ul>
            <li><a href="#"><img src="images/sns-1.png"></a></li>
            <li><a href="#"><img src="images/sns-2.png"></a></li>
            <li><a href="#"><img src="images/sns-3.png"></a></li>
            <li></li>
          </ul>
        </div>

        <div id="fontRight">
          <ul>
            <li>본 사이트는 '네이버'에서 제작한 '나눔스퀘어 네오'를 사용하고 있습니다.</li>
          </ul>

        </div>
      </div>

    </footer>
    <!-- ************************************************************************ footer end -->
  </div>
</body>

</html>