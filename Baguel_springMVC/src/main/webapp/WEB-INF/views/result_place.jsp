<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
 
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
        <h1 class="fw-bold">조회 결과</h1>
      </div>

      <div class="container" id="mainContent">
        <form class="row" action="tester" method="get">
          <div class="col-md-6" id="srchForm">
            <h3 class="fw-semibold">날짜</h3>
            <input type="text" value="${selectDate }" readonly>
          </div>

          <div class="col-md-6" id="srchForm">
            <h3 class="fw-semibold">장소</h3>
            <c:if test="${placeDTO.place eq 'gBpalace'}">
            	<c:set var="place" value="경복궁"/>
            </c:if>
            <c:if test="${placeDTO.place eq 'dSpalace'}">
            	<c:set var="place" value="덕수궁"/>
            </c:if>
            <c:if test="${placeDTO.place eq 'cGpalace'}">
            	<c:set var="place" value="창경궁"/>
            </c:if>
            <c:if test="${placeDTO.place eq 'cDpalace'}">
            	<c:set var="place" value="창덕궁"/>
            </c:if>
            <c:if test="${placeDTO.place eq 'cGarden'}">
            	<c:set var="place" value="서울 어린이 대공원"/>
            </c:if>
            <c:if test="${placeDTO.place eq 'sema'}">
            	<c:set var="place" value="서울 시립 미술관"/>
            </c:if>
            	<input type="text" value="${place }" readonly>
          </div>

        </form>
					<c:if test="${placeDTO.day eq 1 }">
            	<c:set var="day" value="일"/>
					</c:if>
					<c:if test="${placeDTO.day eq 2 }">
            	<c:set var="day" value="월"/>
					</c:if>
					<c:if test="${placeDTO.day eq 3 }">
            	<c:set var="day" value="화"/>
					</c:if>
					<c:if test="${placeDTO.day eq 4 }">
            	<c:set var="day" value="수"/>
					</c:if>
					<c:if test="${placeDTO.day eq 5 }">
            	<c:set var="day" value="목"/>
					</c:if>
					<c:if test="${placeDTO.day eq 6 }">
            	<c:set var="day" value="금"/>
					</c:if>
					<c:if test="${placeDTO.day eq 7 }">
            	<c:set var="day" value="토"/>
					</c:if>

        <div class="row bg-light">
          <div class="col-12">
            <h1 class="fw-bold text-center lh-lg">
              ${selectDate } ${day }요일<br>
              ${place }의 예상 관람객은<br>
              <span class="badge text-bg-success" id="badge">${placeDTO.visitors }명</span> 입니다.
            </h1>
					
          </div>
          <div class="col-12" id="gap"></div>
          <div class="col-xl-6">
            <p class="badge text-bg-secondary bg-gradient fst-italic" id="tmpPcp">
              예상 기온 : <span class="text-warning">${placeResult.avgTemp }°C</span>
            </p>
          </div>
          <div class="col-xl-6">
            <p class="badge text-bg-secondary bg-gradient fst-italic" id="tmpPcp">
              예상 강수량 : <span class="text-warning">${placeResult.precipitation }mm</span>
            </p>
          </div>
          <div class="col-12" id="gap"></div>
          <div class="col-12" id="apiInfo">
            <h4>* 날씨 출처: 기상청 단기 예보 조회서비스 API</h4>
          </div>
        </div> <!-- row -->

        <div class="row" id="midButtons">
          <div class="col-6"></div>
          <div class="col-3">
            <a href="srch_place" class="btn btn-outline-secondary">다른 조건 검색하기</a>
          </div>
          <div class="col-3">
          <c:choose>
          	<c:when test="${userId eq null }">
	            <button disabled class="btn btn-primary" type="button" data-bs-toggle="collapse"
	              data-bs-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
	              자세히 보기
	            </button>
          	</c:when>
          	<c:otherwise>
	            <button class="btn btn-primary" type="button" data-bs-toggle="collapse"
	              data-bs-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
	              자세히 보기
	            </button>
          	</c:otherwise>
          </c:choose>
            <!-- <button type="button" class="btn btn-outline-info">자세히 보기</button> -->
          </div>
        </div>
				
        <div class="row">
					<c:if test="${userId eq null }">
	          <div class="col-12">
		          <div class="alert alert-warning text-center" role="alert">
		            자세히 보기는 로그인 사용자만 이용 가능합니다<br> <a href="login" class="alert-link">로그인 하러가기</a>
		          </div>
	          </div>
	         </c:if>
        </div>
        
        <div class="row">
					<div class="collapse col-12" id="collapseExample">
	        		<h2>2019-${month } 관람객 수</h2>
	        		<h5>* 2021, 2020년 데이터는 코로나로 인한 관람객 감소로 제외 되었습니다. *</h5>
						<div class="card card-body">
							<canvas id="myChart"></canvas> <!-- CHART HERE-->
						</div>
					</div>
					<div class="collapse col-12" id="collapseExample">
						<table class="table table-hover text-center">
							<tr>
							<th>날짜</th>
							<th>관람객 수</th>
							<th>주말 여부</th>
							<th>평균 기온(°C)</th>
							<th>강수량(mm)</th>
							</tr>
								<c:forEach items="${pastData }" var="past" varStatus="status">
									<tr>
										<td>${past.baseDate }</td>
										<td>${past.place }</td>
										<td>
											<c:if test="${past.day eq 1}">
												X
											</c:if>
											<c:if test="${past.day ne 1}">
												O
											</c:if>
										</td>
										<td>${past.tmp }</td>
										<td>${past.pcp }</td>
									</tr>
								</c:forEach>
						</table>
					</div>
          <div class="collapse col-12" id="collapseExample">
            <button type="button" id="upToTop" class="btn btn-dark"onclick="window.scrollTo(0, 0);">👆</button>
          </div>
        </div>
      </div> <!-- container -->
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
		<script>
		  var labels1 = [];
		  var visitors = [];
		  var tmps = [];
	  <c:forEach items="${pastData }" var="past" varStatus="status">
		  labels1.push('${status.index +1}');
		  visitors.push(${past.place });
		  tmps.push(${past.tmp });
	  </c:forEach>
		</script>
  <script>
    var context = document
      .getElementById('myChart')
      .getContext('2d');
    var myChart = new Chart(context, {
      type: 'line', // 차트의 형태 bar or line or pie
      data: { // 차트에 들어갈 데이터
        labels: labels1,
        datasets: [
          { //데이터
            label: '관람객 수', //차트 제목
            
            lineTension: 0.1,
            yAxisID: 'y-left',
            fill: true, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
            data: visitors, //x축 label에 대응되는 데이터 값
            backgroundColor: [
              //색상
              'rgb(255,159,64, 0.2)'
            ],
            borderColor: [
              //경계선 색상
              'rgb(255,159,64)'
            ],
            borderWidth: 3 //경계선 굵기
          }
          , {
            label: '기온(°C)',
            yAxisID: 'y-right',
            fill: false,
            type: 'line',
            data: tmps,
            backgroundColor: 'rgb(54,162,235)', // rgb(75,192,192)
            borderColor: 'rgb(54,162,235)',
            borderWidth: 1 //경계선 굵기
          }
        ]
      },
      options: {
        responsive: true,
        // maintainAspectRatio: false,
        scales: {
          // x: {
          //   title: {
          //     display: true,
          //     text: 'X Axis Title'
          //   }
          // },
          'y-left': {
            type: 'linear',
            position: 'left',
            title: {
              display: false,
              text: 'Y Axis Left'
            },
            grid: {
              display: false
            }
          },
          'y-right': {
            type: 'linear',
            position: 'right',
            title: {
              display: true,
              text: ' 기온'
            },

            grid: {
              display: false
            }
          }
        }
      }
    });
  </script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
    crossorigin="anonymous"></script>
</body>

</html>