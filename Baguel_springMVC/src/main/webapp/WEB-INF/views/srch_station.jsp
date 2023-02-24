<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header_footer.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/srch_station.css">
  <script src="js/srch_station.js"></script>
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
      <!-- !!! 여기부터 작성 !!! -->
      <div id="mainTitleUser">
        <h1>지하철역으로 조회</h1>
      </div>
      <div id="search">
        <!--후에 form태그로 변경하기-->
        <form id="srch_station" name="srchS_form" method="GET" action="result_station">
        <div id="Date">
          <h4>날짜 선택</h4>
          <input id="selectDate" name="selectDate" type="date" required value="${today }">
        </div>
        <div id="selectPlace">
            <h4>지하철역 선택</h4>
            <select id="line" name="line" onchange="stationChange(this)">
              <option value="호선">호선</option>
              <option value="1호선">1호선</option>
              <option value="2호선">2호선</option>
              <option value="3호선">3호선</option>
              <option value="4호선">4호선</option>
              <option value="5호선">5호선</option>
              <option value="6호선">6호선</option>
              <option value="7호선">7호선</option>
              <option value="8호선">8호선</option>
            </select>
            <!-- <input type="text" id="stationName" name="stationName" placeholder="조회할 지하철역을 선택하세요.">																							 -->
            <select id ="stationName" name="stationName">
              <option value="none">호선을 우선 선택해 주세요</option>
            </select>
        </div>
        
        <div>
          <button id="searchIcon" type="button" onclick="stationSrchConfirm()"><img
              id="btnimg" src="images/search.png" ></button>
        </div>
        </form>
      </div>
      <div id="subwayLinemap">
    		<!-- <h4>지하철노선도</h4> -->
    		<img id="subwayImg" src="images/subway.png">
  		</div>
    </main>
    <!-- ************************************************************************ main -->

    <!-- ******************************************************************************footer start -->
    <footer>
      <div id="bottomMenu">
        <ul id="footprint">
          <li>팀 프로젝트</li>
          <li>문인기 / moonpop6@daum.net</li>
          <li>변예진 / byejin.9738@gmail.com</li>
          <li>2022 - 2023</li>
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
    <script>
	  const line1 = [<c:forEach items="${line1 }" var="line">'${line}', </c:forEach>];
	  const line2 = [<c:forEach items="${line2 }" var="line">'${line}', </c:forEach>];
	  const line3 = [<c:forEach items="${line3 }" var="line">'${line}', </c:forEach>];
	  const line4 = [<c:forEach items="${line4 }" var="line">'${line}', </c:forEach>];
	  const line5 = [<c:forEach items="${line5 }" var="line">'${line}', </c:forEach>];
	  const line6 = [<c:forEach items="${line6 }" var="line">'${line}', </c:forEach>];
	  const line7 = [<c:forEach items="${line7 }" var="line">'${line}', </c:forEach>];
	  const line8 = [<c:forEach items="${line8 }" var="line">'${line}', </c:forEach>];
  </script>
</body>

</html>