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
   <link rel="icon" href="images/favicon.png">
  <title>๋ฐ๊ธ</title>
</head>

<body>
  <div id="container">
    <!-- ****************************************************************************** header & nav start-->
    <header>
      <a href="main" id="logo">
        <p>๋ฐ๊ธ๐ถโโ๏ธ๐ถ๐ถโโ๏ธ</p>
        <div id="logoSmall">์์ธ ์ฃผ์์ง์ญ ํผ์ก ์์ธก ์๋น์ค</div>
      </a>
      <div id="loginMenu">
		<c:choose>
			<c:when test="${userLogin eq 'logined' }">
				${userId }&nbsp;&nbsp;
				<a href="mypage">๋ง์ดํ์ด์ง</a>
				<a href="logout">๋ก๊ทธ์์</a>
			</c:when>
			<c:otherwise>
	      <a href="register">ํ์๊ฐ์</a>
				<a href="login">๋ก๊ทธ์ธ</a>
			</c:otherwise>
		</c:choose>
		</div>
    </header>
    <nav>
      <ul id="navi">
        <li><a href="#">ํผ์ก ์์ธก</a>
          <ul>
            <li><a href="srch_station">์ญ์ผ๋ก ์กฐํ</a></li>
            <li><a href="srch_place">์ฅ์๋ก ์กฐํ</a></li>
          </ul>
        </li>
        <li><a href="cal_view">๋ฌ๋ ฅ์ผ๋ก ์กฐํ</a>
          <ul>
            <li><a href="cal_view">๋ฌ๋ ฅ์ผ๋ก ์กฐํ</a></li>
            <li><a href="cal_add">์ผ์  ๋ฑ๋ก ์์ฒญ</a></li>
            <li><a href="cal_list">์์ฒญ๋ ์ผ์ </a></li>
          </ul>
        </li>
        <li><a href="map">์ง๋๋ก ์กฐํ</a></li>
        <li><a href="#">์ด์ฉ ์๋ด</a>
          <ul>
            <li><a href="about">about ๋ฐ๊ธ</a></li>
          </ul>
        </li>
      </ul>
    </nav>
    <!-- ************************************************************************* header & nav end -->

    <!-- ******************************************************************************main start -->
    <main>
      <div id="mainTitleUser">
        <h1 class="fw-bold">์กฐํ ๊ฒฐ๊ณผ</h1>
      </div>

      <div class="container" id="mainContent">
        <form class="row" action="tester" method="get">
          <div class="col-md-6" id="srchForm">
            <h3 class="fw-semibold">๋ ์ง</h3>
            <input type="text" value="${selectDate }" readonly>
          </div>

          <div class="col-md-6" id="srchForm">
            <h3 class="fw-semibold">์ฅ์</h3>
            <c:if test="${placeDTO.place eq 'gBpalace'}">
            	<c:set var="place" value="๊ฒฝ๋ณต๊ถ"/>
            </c:if>
            <c:if test="${placeDTO.place eq 'dSpalace'}">
            	<c:set var="place" value="๋์๊ถ"/>
            </c:if>
            <c:if test="${placeDTO.place eq 'cGpalace'}">
            	<c:set var="place" value="์ฐฝ๊ฒฝ๊ถ"/>
            </c:if>
            <c:if test="${placeDTO.place eq 'cDpalace'}">
            	<c:set var="place" value="์ฐฝ๋๊ถ"/>
            </c:if>
            <c:if test="${placeDTO.place eq 'cGarden'}">
            	<c:set var="place" value="์์ธ ์ด๋ฆฐ์ด ๋๊ณต์"/>
            </c:if>
            <c:if test="${placeDTO.place eq 'sema'}">
            	<c:set var="place" value="์์ธ ์๋ฆฝ ๋ฏธ์ ๊ด"/>
            </c:if>
            	<input type="text" value="${place }" readonly>
          </div>

        </form>
					<c:if test="${placeDTO.day eq 1 }">
            	<c:set var="day" value="์ผ"/>
					</c:if>
					<c:if test="${placeDTO.day eq 2 }">
            	<c:set var="day" value="์"/>
					</c:if>
					<c:if test="${placeDTO.day eq 3 }">
            	<c:set var="day" value="ํ"/>
					</c:if>
					<c:if test="${placeDTO.day eq 4 }">
            	<c:set var="day" value="์"/>
					</c:if>
					<c:if test="${placeDTO.day eq 5 }">
            	<c:set var="day" value="๋ชฉ"/>
					</c:if>
					<c:if test="${placeDTO.day eq 6 }">
            	<c:set var="day" value="๊ธ"/>
					</c:if>
					<c:if test="${placeDTO.day eq 7 }">
            	<c:set var="day" value="ํ "/>
					</c:if>

        <div class="row bg-light">
          <div class="col-12">
            <h1 class="fw-bold text-center lh-lg">
              ${selectDate } ${day }์์ผ<br>
              ${place }์ ์์ ๊ด๋๊ฐ์<br>
              <span class="badge text-bg-success" id="badge">${placeDTO.visitors }๋ช</span> ์๋๋ค.
            </h1>
					
          </div>
          <div class="col-12" id="gap"></div>
          <div class="col-xl-6">
            <p class="badge text-bg-secondary bg-gradient fst-italic" id="tmpPcp">
              ์์ ๊ธฐ์จ : <span class="text-warning">${placeResult.avgTemp }ยฐC</span>
            </p>
          </div>
          <div class="col-xl-6">
            <p class="badge text-bg-secondary bg-gradient fst-italic" id="tmpPcp">
              ์์ ๊ฐ์๋ : <span class="text-warning">${placeResult.precipitation }mm</span>
            </p>
          </div>
          <div class="col-12" id="gap"></div>
          <div class="col-12" id="apiInfo">
            <h4>* ๋ ์จ ์ถ์ฒ: ๊ธฐ์์ฒญ ๋จ๊ธฐ ์๋ณด ์กฐํ์๋น์ค API</h4>
          </div>
        </div> <!-- row -->

        <div class="row" id="midButtons">
          <div class="col-6"></div>
          <div class="col-3">
            <a href="srch_place" class="btn btn-outline-secondary">๋ค๋ฅธ ์กฐ๊ฑด ๊ฒ์ํ๊ธฐ</a>
          </div>
          <div class="col-3">
          <c:choose>
          	<c:when test="${userId eq null }">
	            <button disabled class="btn btn-primary" type="button" data-bs-toggle="collapse"
	              data-bs-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
	              ์์ธํ ๋ณด๊ธฐ
	            </button>
          	</c:when>
          	<c:otherwise>
	            <button class="btn btn-primary" type="button" data-bs-toggle="collapse"
	              data-bs-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
	              ์์ธํ ๋ณด๊ธฐ
	            </button>
          	</c:otherwise>
          </c:choose>
            <!-- <button type="button" class="btn btn-outline-info">์์ธํ ๋ณด๊ธฐ</button> -->
          </div>
        </div>
				
        <div class="row">
					<c:if test="${userId eq null }">
	          <div class="col-12">
		          <div class="alert alert-warning text-center" role="alert">
		            ์์ธํ ๋ณด๊ธฐ๋ ๋ก๊ทธ์ธ ์ฌ์ฉ์๋ง ์ด์ฉ ๊ฐ๋ฅํฉ๋๋ค<br> <a href="login" class="alert-link">๋ก๊ทธ์ธ ํ๋ฌ๊ฐ๊ธฐ</a>
		          </div>
	          </div>
	         </c:if>
        </div>
        
        <div class="row">
					<div class="collapse col-12" id="collapseExample">
	        		<h2>2019-${month } ๊ด๋๊ฐ ์</h2>
	        		<h5>* 2021, 2020๋ ๋ฐ์ดํฐ๋ ์ฝ๋ก๋๋ก ์ธํ ๊ด๋๊ฐ ๊ฐ์๋ก ์ ์ธ ๋์์ต๋๋ค. *</h5>
						<div class="card card-body">
							<canvas id="myChart"></canvas> <!-- CHART HERE-->
						</div>
					</div>
					<div class="collapse col-12" id="collapseExample">
						<table class="table table-hover text-center">
							<tr>
							<th>๋ ์ง</th>
							<th>๊ด๋๊ฐ ์</th>
							<th>์ฃผ๋ง ์ฌ๋ถ</th>
							<th>ํ๊ท  ๊ธฐ์จ(ยฐC)</th>
							<th>๊ฐ์๋(mm)</th>
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
            <button type="button" id="upToTop" class="btn btn-dark"onclick="window.scrollTo(0, 0);">๐</button>
          </div>
        </div>
      </div> <!-- container -->
    </main>
    <!-- ************************************************************************ main -->

    <!-- ******************************************************************************footer start -->
    <footer>
      <div id="bottomMenu">
        <ul id="footprint">
          <li>ํ ํ๋ก์ ํธ</li>
          <li>๋ฌธ์ธ๊ธฐ / moonpop6@daum.net</li>
          <li>๋ณ์์ง / byejin.9738@gmail.com</li>
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
            <li>๋ณธ ์ฌ์ดํธ๋ '๋ค์ด๋ฒ'์์ ์ ์ํ '๋๋์คํ์ด ๋ค์ค'๋ฅผ ์ฌ์ฉํ๊ณ  ์์ต๋๋ค.</li>
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
      type: 'line', // ์ฐจํธ์ ํํ bar or line or pie
      data: { // ์ฐจํธ์ ๋ค์ด๊ฐ ๋ฐ์ดํฐ
        labels: labels1,
        datasets: [
          { //๋ฐ์ดํฐ
            label: '๊ด๋๊ฐ ์', //์ฐจํธ ์ ๋ชฉ
            
            lineTension: 0.1,
            yAxisID: 'y-left',
            fill: true, // line ํํ์ผ ๋, ์  ์์ชฝ์ ์ฑ์ฐ๋์ง ์์ฑ์ฐ๋์ง
            data: visitors, //x์ถ label์ ๋์๋๋ ๋ฐ์ดํฐ ๊ฐ
            backgroundColor: [
              //์์
              'rgb(255,159,64, 0.2)'
            ],
            borderColor: [
              //๊ฒฝ๊ณ์  ์์
              'rgb(255,159,64)'
            ],
            borderWidth: 3 //๊ฒฝ๊ณ์  ๊ตต๊ธฐ
          }
          , {
            label: '๊ธฐ์จ(ยฐC)',
            yAxisID: 'y-right',
            fill: false,
            type: 'line',
            data: tmps,
            backgroundColor: 'rgb(54,162,235)', // rgb(75,192,192)
            borderColor: 'rgb(54,162,235)',
            borderWidth: 1 //๊ฒฝ๊ณ์  ๊ตต๊ธฐ
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
              text: ' ๊ธฐ์จ'
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