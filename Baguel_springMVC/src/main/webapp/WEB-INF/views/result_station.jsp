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
  		<div id="mainTitle">
        <h1>์กฐํ ๊ฒฐ๊ณผ</h1>
      </div>
    
      <div id="result">
        <div id="selectDate">
          <h4>๋ ์ง</h4>
          <input type="text" placeholder="${stationDTO.selectDate }" readonly>
        </div>
        <div id="selectPlace">
          <h4>์ฅ์</h4>
          <input type="text" placeholder="${stationDTO.line}-${stationDTO.stationName}" readonly>
        </div>
      </div>
    
      <div id="ERR">
        <!-- <h4>๊ฒ์ ๊ฒฐ๊ณผ</h4> -->
        <h1>
          ${stationDTO.selectDate} ${stationDTO.line} ${stationDTO.stationName}์ญ์
          <br>์์ธก ํผ์ก๋ฅ ์
          <mark>${stationDTO.err}</mark> ์๋๋ค.
        </h1>
      </div>

      <hr>
      
      <div id="others">
        <div id="ERRexplain">
          <table id="ERRTable">
            <th>ํผ์ก๋</th>
            <th>๊ธฐ์ค(1๋ ๋น ์ ์ 160๋ช)</th>
            <th>์ฑ์ธ ๊ธฐ์ค(65kg)</th>
            <tr id="seamless">
              <td>์ฌ์ </td>
              <td>79% ์ดํ</td>
              <td>127๋ช ์ดํ</td>
            </tr>
            <tr id="normal">
              <td>๋ณดํต</td>
              <td>80%~129%</td>
              <td>128~207๋ช</td>
            </tr>
            <tr id="crowded">
              <td>ํผ์ก</td>
              <td>130%</td>
              <td>208๋ช ์ด์</td>
            </tr>
          </table>
          
          <div id="standard">
            <p>* ์์ธ๋ฉํธ๋ก ๊ธฐ์ค</p>
          </div>
        </div>
        <div id="button">
          <input type="image" id="backIcon" src="images/back2.png" onclick="location.href='srch_station.html'">
          <input type="image" id="moreIcon" src="images/more2.png" name="more" onclick="createGraph()">
        </div>
      </div>
      
      <div id="chart">
      	<div id="chartTitle">
      		<h1>${stationDTO.selectDate} ${stationDTO.line} ${stationDTO.stationName}์ญ<br>์๊ฐ๋ณ ํผ์ก๋ฅ </h1> 
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
        	var slabels = ['5:30~6:30', '7:00~9:30', '10:00~4:30', '5:00~7:30', '8:00~9:30', '10:00~๋ง์ฐจ'];

        		<c:forEach var="StationDTO" items="${perTimeSList}">
	        		<c:choose>
	        			<c:when test = "${StationDTO.direction eq '๋ด์ '}">
	     					innerLine = ["${StationDTO.t55_65}", "${StationDTO.t70_95}", "${StationDTO.t100_165}", "${StationDTO.t170_195}", "${StationDTO.t200_215}", "${StationDTO.t220_last}"]
	     				</c:when>
	     				<c:when test = "${StationDTO.direction eq '์ธ์ '}">
	     					outerLine = ["${StationDTO.t55_65}", "${StationDTO.t70_95}", "${StationDTO.t100_165}", "${StationDTO.t170_195}", "${StationDTO.t200_215}", "${StationDTO.t220_last}"]
	     				</c:when>
	     				<c:when test = "${StationDTO.direction eq '์์ '}">
	     					upperLine = ["${StationDTO.t55_65}", "${StationDTO.t70_95}", "${StationDTO.t100_165}", "${StationDTO.t170_195}", "${StationDTO.t200_215}", "${StationDTO.t220_last}"]
	     				</c:when>
	     				<c:when test = "${StationDTO.direction eq 'ํ์ '}">
	     					lowerLine = ["${StationDTO.t55_65}", "${StationDTO.t70_95}", "${StationDTO.t100_165}", "${StationDTO.t170_195}", "${StationDTO.t200_215}", "${StationDTO.t220_last}"]
	     				</c:when>
	     			</c:choose>
     			</c:forEach>
        	
     		var line2Data = [{ //๋ฐ์ดํฐ
                
                label: '๋ด์ ', //์ฐจํธ ์ ๋ชฉ
                fill: false, // line ํํ์ผ ๋, ์  ์์ชฝ์ ์ฑ์ฐ๋์ง ์์ฑ์ฐ๋์ง
                data: innerLine
                	 //x์ถ label์ ๋์๋๋ ๋ฐ์ดํฐ ๊ฐ
                ,
                backgroundColor:
                	'rgba(218, 218, 218, 0.8)',
                borderColor: 
                	'rgba(218, 218, 218, 1)' ,
                borderWidth: 3 //๊ฒฝ๊ณ์  ๊ตต๊ธฐ
            },
            { //๋ฐ์ดํฐ
                
                label: '์ธ์ ', //์ฐจํธ ์ ๋ชฉ
                fill: false, // line ํํ์ผ ๋, ์  ์์ชฝ์ ์ฑ์ฐ๋์ง ์์ฑ์ฐ๋์ง
                data: outerLine
                	 //x์ถ label์ ๋์๋๋ ๋ฐ์ดํฐ ๊ฐ
                ,
                backgroundColor:
                	'rgba(95, 95, 95, 0.8)' ,
                borderColor:
                	'rgba(95, 95, 95, 1)' ,
                borderWidth: 3 //๊ฒฝ๊ณ์  ๊ตต๊ธฐ
            }];
     		
     		var lineOtherData = [{ //๋ฐ์ดํฐ
                
                label: '์์ ', //์ฐจํธ ์ ๋ชฉ
                fill: false, // line ํํ์ผ ๋, ์  ์์ชฝ์ ์ฑ์ฐ๋์ง ์์ฑ์ฐ๋์ง
                data: upperLine
                	 //x์ถ label์ ๋์๋๋ ๋ฐ์ดํฐ ๊ฐ
                ,
                backgroundColor:
                	'rgba(218, 218, 218, 0.8)',
                borderColor: 
                	'rgba(218, 218, 218, 1)' ,
                borderWidth: 3 //๊ฒฝ๊ณ์  ๊ตต๊ธฐ
            },
				{ //๋ฐ์ดํฐ
                
                label: 'ํ์ ', //์ฐจํธ ์ ๋ชฉ
                fill: false, // line ํํ์ผ ๋, ์  ์์ชฝ์ ์ฑ์ฐ๋์ง ์์ฑ์ฐ๋์ง
                data: lowerLine
                	 //x์ถ label์ ๋์๋๋ ๋ฐ์ดํฐ ๊ฐ
                ,
                backgroundColor:
                	'rgba(95, 95, 95, 0.8)' ,
                borderColor:
                	'rgba(95, 95, 95, 1)' ,
                borderWidth: 3 //๊ฒฝ๊ณ์  ๊ตต๊ธฐ
            }];
     			
     		var data = {
     				<c:choose>
     					<c:when test = "${line eq '2ํธ์ '}">
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
	            type: 'line', // ์ฐจํธ์ ํํ
	            
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
</body>
</html>