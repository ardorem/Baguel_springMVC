<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header_footer.css"> 
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/best5.css">
  	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.1/chart.js"></script>
  	


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
    	<div id="mainTitle">
        	<h1><mark>작년의 오늘</mark> 조회 결과</h1>
      	</div>
      	
    	<div id="best5Chart">
    		<canvas id="myChart" ></canvas>
    	</div>
    	
    	<div id="others">
	        <div id="ERRexplain">
	          <table id="ERRTable">
	            <th>혼잡도</th>
	            <th>기준(1량 당 정원 160명)</th>
	            <th>성인 기준(65kg)</th>
	            <tr id="seamless">
	              <td>여유</td>
	              <td>79% 이하</td>
	              <td>127명 이하</td>
	            </tr>
	            <tr id="normal">
	              <td>보통</td>
	              <td>80%~129%</td>
	              <td>128~207명</td>
	            </tr>
	            <tr id="crowded">
	              <td>혼잡</td>
	              <td>130%</td>
	              <td>208명 이상</td>
	            </tr>
	          </table>
	          
	          <div id="standard">
	            <p>* 서울메트로 기준</p>
	          </div>
	        </div>
	        
	        <div id="button">
	          <input type="image" id="gotoStationIcon" src="images/gotoStation.png" onclick="location.href='srch_station'">
	          <input type="image" id="gotoPlaceIcon" src="images/gotoPlace.png" name="more" onclick="location.href='srch_place'">
	        </div>
	    </div>
      	
    	
    	<script>
    		var tLabels = ['송파', '사당', '교대', '석촌', '방배'];
    		var tDatas = ['51.34', '50.39', '50.2', '50.16', '48,78'];
			
			
			var context = document
            .getElementById('myChart')
            .getContext('2d');
			
        var myChart = new Chart(context, {
            type: 'bar', // 차트의 형태
            data: { // 차트에 들어갈 데이터
                labels: tLabels,
                datasets: [
                    { //데이터
                        label: '혼잡률 상위5개 지하철역', //차트 제목
                        fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                        data: ['51.34', '50.39', '50.2', '50.16', '48.78'],
                        backgroundColor: [
                            //색상
                            'rgba(67, 116, 160, 0.7)',
                            'rgba(80, 137, 188, 0.7)',
                            'rgba(91, 155, 213, 0.7)',
                            'rgba(151, 185, 224, 0.7)',
                            'rgba(190, 209, 234, 0.7)'
                           
                        ],
                        borderColor: [
                            //경계선 색상
                        	'rgba(67, 116, 160, 1)',
                            'rgba(80, 137, 188, 1)',
                            'rgba(91, 155, 213, 1)',
                            'rgba(151, 185, 224, 1)',
                            'rgba(190, 209, 234, 1)'
                          
                        ],
                        borderWidth: 1 //경계선 굵기
                    }
                ]
            },
            options: {
            	responsive : true,
                scales: {
                    yAxes: [
                        {
                            ticks: {
                                beginAtZero: true
                            }
                        }
                    ]
                }
            }
        });
        	
        </script>
    </main>
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
    
</body>
</html>