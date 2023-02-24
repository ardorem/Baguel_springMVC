<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
  <link rel="stylesheet" href="css/header_footer.css">
  <link rel="stylesheet" href="css/srch_place.css">
    <link rel="icon" href="images/favicon.png">
<script>
	function changeItem() {
		let daySelect = document.getElementById("daySelect");

		// select element에서 선택된 option의 value
		let itemID = daySelect.options[daySelect.selectedIndex].value;
		console.log('itemID: ' + itemID);
		if(itemID == "${todayV }") {
			document.getElementById("hiddenDay").innerHTML = "<input type='hidden' name='day' value='${todayDay }'><input type='hidden' name='selectDate' value='${today }'>";
		} else if(itemID == "${tomorrowV }") {
			document.getElementById("hiddenDay").innerHTML = "<input type='hidden' name='day' value='${tomorrowDay }'><input type='hidden' name='selectDate' value='${tomorrow }'>";
		} else if(itemID == "${dAtomorrowV }") {
			document.getElementById("hiddenDay").innerHTML = "<input type='hidden' name='day' value='${dAtomorrowDay }'><input type='hidden' name='selectDate' value='${dAtomorrow }'>";
		}
	}
	
	function changeXy() {
		let placeSelect = document.getElementById("placeSelect");

		// select element에서 선택된 option의 value
		let placeID = placeSelect.options[placeSelect.selectedIndex].value;
		console.log('placeID: ' + placeID);
		if(placeID == "cGarden") {
			document.getElementById("hiddenXy").innerHTML = "<input type='hidden' name='xy' value='62_126'>";
		} else {
			document.getElementById("hiddenXy").innerHTML = "<input type='hidden' name='xy' value='60_127'>";
		}
	}
</script>
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
        <h1 class="fw-bold">장소로 조회</h1>
      </div>

      <div class="container" id="mainContent">
        <form class="row" action="result_place" method="get" id="placeSrchFrm">
          <div class="col-md-6" id="srchForm">
            <h3 class="fw-semibold">날짜 선택</h3>
            
						<div id="hiddenDay"></div>
						<div id="hiddenXy"></div>
						
            <select size="1" name="fcstDate" id="daySelect" onchange="changeItem()">
              <option value="none" selected id="selected" >날짜를 선택해 주세요</option>
              <option value="${todayV }">
              	${today } (오늘)
              	<c:if test="${todayDay eq 1 }"> (일)</c:if>
              	<c:if test="${todayDay eq 2 }"> (월)</c:if>
              	<c:if test="${todayDay eq 3 }"> (화)</c:if>
              	<c:if test="${todayDay eq 4 }"> (수)</c:if>
              	<c:if test="${todayDay eq 5 }"> (목)</c:if>
              	<c:if test="${todayDay eq 6 }"> (금)</c:if>
              	<c:if test="${todayDay eq 7 }"> (토)</c:if>
              </option>

							<option value="${tomorrowV }">
              	${tomorrow }
              	<c:if test="${tomorrowDay eq 1 }"> (일)</c:if>
              	<c:if test="${tomorrowDay eq 2 }"> (월)</c:if>
              	<c:if test="${tomorrowDay eq 3 }"> (화)</c:if>
              	<c:if test="${tomorrowDay eq 4 }"> (수)</c:if>
              	<c:if test="${tomorrowDay eq 5 }"> (목)</c:if>
              	<c:if test="${tomorrowDay eq 6 }"> (금)</c:if>
              	<c:if test="${tomorrowDay eq 7 }"> (토)</c:if>
              </option>
              <option value="${dAtomorrowV }">
              	${dAtomorrow }
              	<c:if test="${dAtomorrowDay eq 1 }"> (일)</c:if>
              	<c:if test="${dAtomorrowDay eq 2 }"> (월)</c:if>
              	<c:if test="${dAtomorrowDay eq 3 }"> (화)</c:if>
              	<c:if test="${dAtomorrowDay eq 4 }"> (수)</c:if>
              	<c:if test="${dAtomorrowDay eq 5 }"> (목)</c:if>
              	<c:if test="${dAtomorrowDay eq 6 }"> (금)</c:if>
              	<c:if test="${dAtomorrowDay eq 7 }"> (토)</c:if>
             	</option>
            </select>
          </div>

          <div class="col-md-5" id="srchForm">
            <h3 class="fw-semibold">장소 선택</h3>
            <select size="1" name="place" id="placeSelect" onchange="changeXy()">
              <option value="none" selected id="selected">조회할 장소를 선택하세요.</option>
              <option value="gBpalace">경복궁</option>
              <option value="dSpalace">덕수궁</option>
              <option value="cGpalace">창경궁</option>
              <option value="cDpalace">창덕궁</option>
              <option value="cGarden">서울 어린이 대공원</option>
              <option value="sema">서울 시립 미술관</option>
            </select>
          </div>

          <div class="col-md-1" id="buttonArea">
            <button id="searchIcon" type="button" onclick="placeSrchConfirm()">
              <img id="btnimg" src="images/search.png">
            </button>
          </div>
        </form>
        
				<div class="row">
					<div class="col-12">
						<div class="alert alert-success fs-5" role="alert">
							<span class="fw-bold">기상청 단기예보</span>로 날씨 조회가 가능한 <span
								class="text-decoration-underline"> 오늘, 내일, 내일모래 </span><span
								class="fw-bold">3일</span> 예측 가능
						</div>
					</div>
				</div>
				
				<div class="row">
          <div class="col-12" id="carousel">
            <div class="placePhoto">
              <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-indicators">
                  <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active"
                    aria-current="true" aria-label="Slide 1"></button>
                  <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1"
                    aria-label="Slide 2"></button>
                  <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2"
                    aria-label="Slide 3"></button>
                  <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="3"
                    aria-label="Slide 3"></button>
                  <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="4"
                    aria-label="Slide 3"></button>
                </div>
                <div class="carousel-inner">
                  <div class="carousel-item active" data-bs-interval="3000">
                    <img src="images/sema.jpg" class="d-block w-100" alt="서울시립미술관">
                  </div>
                  <div class="carousel-item" data-bs-interval="3000">
                    <img src="images/gyeongbokgung.jpg" class="d-block w-100" alt="경복궁">
                  </div>
                  <div class="carousel-item" data-bs-interval="3000">
                    <img src="images/sec.jpg" class="d-block w-100" alt="서울 어린이 대공원">
                  </div>
                  <div class="carousel-item" data-bs-interval="3000">
                    <img src="images/nSeoulTower.jpg" class="d-block w-100" alt="N서울타워">
                  </div>
                  <div class="carousel-item" data-bs-interval="3000">
                    <img src="images/hanok.jpg" class="d-block w-100" alt="북촌한옥마을">
                  </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions"
                  data-bs-slide="prev">
                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                  <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions"
                  data-bs-slide="next">
                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                  <span class="visually-hidden">Next</span>
                </button>
              </div>
            </div> <!-- Carousel -->
          </div>
        </div> <!-- row -->
      </div> <!-- container -->
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
  <script src="js/srch_place.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
    crossorigin="anonymous"></script>
</body>

</html>