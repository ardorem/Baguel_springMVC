<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=devi
  ce-width, initial-scale=1.0">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
  <link rel="stylesheet" href="css/header_footer.css">
  <link rel="stylesheet" href="css/map.css">
  <!-- 맵api 관련 js start-->
  <script defer src="js/map.js"></script>
  <script defer
    src="https://maps.googleapis.com/maps/api/js?key=KEY HERE&callback=initMap"></script>
  <!-- 맵api 관련 js end-->
  <title>바글</title>
  <script>
    const pin_line1 = [
			<c:forEach items="${line1 }" var="line">
			 { line: "${line.line}", lineNo: "${line.lineNo}", stationNo: "${line.stationNo}", stationName: "${line.stationName}", lng: ${line.lng}, lat: ${line.lat}, err: ${line.err}, url: "main" },
			</c:forEach>
    ];
    const pin_line2 = [
			<c:forEach items="${line2 }" var="line">
			 { line: "${line.line}", lineNo: "${line.lineNo}", stationNo: "${line.stationNo}", stationName: "${line.stationName}", lng: ${line.lng}, lat: ${line.lat}, err: ${line.err}, url: "main" },
			</c:forEach>
    ];
    const pin_line3 = [
			<c:forEach items="${line3 }" var="line">
			 { line: "${line.line}", lineNo: "${line.lineNo}", stationNo: "${line.stationNo}", stationName: "${line.stationName}", lng: ${line.lng}, lat: ${line.lat}, err: ${line.err}, url: "main" },
			</c:forEach>
    ];
    const pin_line4 = [
			<c:forEach items="${line4 }" var="line">
			 { line: "${line.line}", lineNo: "${line.lineNo}", stationNo: "${line.stationNo}", stationName: "${line.stationName}", lng: ${line.lng}, lat: ${line.lat}, err: ${line.err}, url: "main" },
			</c:forEach>
    ];
    const pin_line5 = [
			<c:forEach items="${line5 }" var="line">
			 { line: "${line.line}", lineNo: "${line.lineNo}", stationNo: "${line.stationNo}", stationName: "${line.stationName}", lng: ${line.lng}, lat: ${line.lat}, err: ${line.err}, url: "main" },
			</c:forEach>
    ];
    const pin_line6 = [
			<c:forEach items="${line6 }" var="line">
			 { line: "${line.line}", lineNo: "${line.lineNo}", stationNo: "${line.stationNo}", stationName: "${line.stationName}", lng: ${line.lng}, lat: ${line.lat}, err: ${line.err}, url: "main" },
			</c:forEach>
    ];
    const pin_line7 = [
			<c:forEach items="${line7 }" var="line">
			 { line: "${line.line}", lineNo: "${line.lineNo}", stationNo: "${line.stationNo}", stationName: "${line.stationName}", lng: ${line.lng}, lat: ${line.lat}, err: ${line.err}, url: "main" },
			</c:forEach>
    ];
    const pin_line8 = [
			<c:forEach items="${line8 }" var="line">
			 { line: "${line.line}", lineNo: "${line.lineNo}", stationNo: "${line.stationNo}", stationName: "${line.stationName}", lng: ${line.lng}, lat: ${line.lat}, err: ${line.err}, url: "main" },
			</c:forEach>
    ];
    
    const pin_place = [
		<c:forEach items="${places }" var="place">
			<c:set var="url" value="${pageContext.request.contextPath}/result_place?day=${day }&selectDate=${selectDate }&xy=${place.xy }&fcstDate=${fcstDate }&place=${place.place }"/>
      { label: "P", placeName: "${place.placeName }", lat: ${place.lat }, lng: ${place.lng }, tmp: '${place.avgTemp}', pcp: '${place.precipitation}',visitors: '${place.visitors }', url: "${url}" },
     </c:forEach>
    ];
  </script>
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
      <div class="row" id="mapMain">
        <div class="col-12">
          <div id="mainTitleUser">
            <h1 class="fw-semibold" style="margin-bottom: 50px;">지도로 조회</h1>
          </div>
        </div>
        <div class="col-12" id="mapInfo">
          <div class="alert alert-success text-center shadow-sm" role="alert">
            <p class="fs-3 mb-0">예측 기준일 : <span class="badge text-bg-warning">2022년 02월 05일(오늘)</span></p>
          </div>
          <div class="alert alert-info text-center shadow-sm" role="alert">
            <p class="fs-4 mb-0">☑ <span class="fw-semibold">핀에 마우스를 올리면</span> 예측 정보를 확인할 수 있습니다.</p>
            <p class="fs-4 mb-0">☑ <spna class="fw-semibold">핀을 클릭하면</spna> 상세 정보 페이지로 이동합니다</p>
          </div>
        </div>

        <!-- <div id="colorBar">
          <div id="colorName">원할</div>
          <div id="colorName">보통</div>
          <div id="colorName">붐빔</div>
          <div id="colorName">혼잡</div>
        </div> -->
        <div class="co1-12 shadow">
          <div id="map"></div>
        </div>
      </div>
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
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
    crossorigin="anonymous"></script>
</body>

</html>