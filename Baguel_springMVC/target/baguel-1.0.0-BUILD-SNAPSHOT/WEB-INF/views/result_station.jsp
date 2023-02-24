<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header_footer.css"> 
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/result_station.css">
  <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.3.slim.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.1/chart.js"></script>

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
        <h1>조회 결과</h1>
      </div>
    
      <div id="result">
        <div id="selectDate">
          <h4>날짜</h4>
          <input type="text" placeholder="${stationDTO.selectDate }" readonly>
        </div>
        <div id="selectPlace">
          <h4>장소</h4>
          <input type="text" placeholder="${stationDTO.line}-${stationDTO.stationName}" readonly>
        </div>
      </div>
    
      <div id="ERR">
        <!-- <h4>검색 결과</h4> -->
        <h1>
          ${stationDTO.selectDate} ${stationDTO.line} ${stationDTO.stationName}역의
          <br>예측 혼잡률은
          <mark>${stationDTO.err}</mark> 입니다.
        </h1>
      </div>

      <hr>
      
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
          <input type="image" id="backIcon" src="images/back2.png" onclick="location.href='srch_station.html'">
          <input type="image" id="moreIcon" src="images/more2.png" name="more" onclick="createGraph()">
        </div>
      </div>
      
      <div id="chart">
      	<div id="chartTitle">
      		<h1>${stationDTO.selectDate} ${stationDTO.line} ${stationDTO.stationName}역<br>시간별 혼잡률</h1> 
      	</div>
      	<div id="perTimeChart" >
      		<canvas id="myChart" ></canvas>
      	</div>
      </div>
        	<script>
        	
        	$("#chartTitle").hide() 
        	
        	var innerLine = [];
        	var outerLine = [];
        	var upperLine = [];
        	var lowerLine = [];
        	var slabels = ['5:30~6:30', '7:00~9:30', '10:00~4:30', '5:00~7:30', '8:00~9:30', '10:00~막차'];

        		<c:forEach var="StationDTO" items="${perTimeSList}">
	        		<c:choose>
	        			<c:when test = "${StationDTO.direction eq '내선'}">
	     					innerLine = ["${StationDTO.t55_65}", "${StationDTO.t70_95}", "${StationDTO.t100_165}", "${StationDTO.t170_195}", "${StationDTO.t200_215}", "${StationDTO.t220_last}"]
	     				</c:when>
	     				<c:when test = "${StationDTO.direction eq '외선'}">
	     					outerLine = ["${StationDTO.t55_65}", "${StationDTO.t70_95}", "${StationDTO.t100_165}", "${StationDTO.t170_195}", "${StationDTO.t200_215}", "${StationDTO.t220_last}"]
	     				</c:when>
	     				<c:when test = "${StationDTO.direction eq '상선'}">
	     					upperLine = ["${StationDTO.t55_65}", "${StationDTO.t70_95}", "${StationDTO.t100_165}", "${StationDTO.t170_195}", "${StationDTO.t200_215}", "${StationDTO.t220_last}"]
	     				</c:when>
	     				<c:when test = "${StationDTO.direction eq '하선'}">
	     					lowerLine = ["${StationDTO.t55_65}", "${StationDTO.t70_95}", "${StationDTO.t100_165}", "${StationDTO.t170_195}", "${StationDTO.t200_215}", "${StationDTO.t220_last}"]
	     				</c:when>
	     			</c:choose>
     			</c:forEach>
        	
     		var line2Data = [{ //데이터
                
                label: '내선', //차트 제목
                fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                data: innerLine
                	 //x축 label에 대응되는 데이터 값
                ,
                backgroundColor:
                	'rgba(218, 218, 218, 0.8)',
                borderColor: 
                	'rgba(218, 218, 218, 1)' ,
                borderWidth: 3 //경계선 굵기
            },
            { //데이터
                
                label: '외선', //차트 제목
                fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                data: outerLine
                	 //x축 label에 대응되는 데이터 값
                ,
                backgroundColor:
                	'rgba(95, 95, 95, 0.8)' ,
                borderColor:
                	'rgba(95, 95, 95, 1)' ,
                borderWidth: 3 //경계선 굵기
            }];
     		
     		var lineOtherData = [{ //데이터
                
                label: '상선', //차트 제목
                fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                data: upperLine
                	 //x축 label에 대응되는 데이터 값
                ,
                backgroundColor:
                	'rgba(218, 218, 218, 0.8)',
                borderColor: 
                	'rgba(218, 218, 218, 1)' ,
                borderWidth: 3 //경계선 굵기
            },
				{ //데이터
                
                label: '하선', //차트 제목
                fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                data: lowerLine
                	 //x축 label에 대응되는 데이터 값
                ,
                backgroundColor:
                	'rgba(95, 95, 95, 0.8)' ,
                borderColor:
                	'rgba(95, 95, 95, 1)' ,
                borderWidth: 3 //경계선 굵기
            }];
     			
     		var data = {
     				<c:choose>
     					<c:when test = "${line eq '2호선'}">
		     				labels: slabels,
		                    datasets: line2Data
	                 	</c:when>
	                   	<c:otherwise>
		                   	labels: slabels,
			                datasets: lineOtherData
	                   	</c:otherwise>
	                </c:choose>
     		};
        	
        	function createGraph() {
				
        		$("#chartTitle").show() 
        		
	        	var context = document.getElementById('myChart').getContext('2d');
	        	
	        	var myChart = new Chart(context, {
	            type: 'line', // 차트의 형태
	            
	            data: data,
	           
	                options: { 
	                	responsive: true,
	                    scales: {
	                    	y: {
	                           
	                                beginAtZero:true
	                         
	                        }
	                    }
	                }
	            });
        	}
        	
        	</script>
        
	</main>
    <!-- <script src="js/more.js"></script> -->
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
</body>
</html>