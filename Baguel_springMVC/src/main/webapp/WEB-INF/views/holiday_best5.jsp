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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/best5.css?after">
  	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.1/chart.js"></script>
  	


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
    		<h1><mark>์ผ์ผ์ </mark> ์กฐํ ๊ฒฐ๊ณผ</h1>
      	</div>
      	
    	<div id="best5Chart">
    		<canvas id="myChart" ></canvas>
    	</div>
    	
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
	          <input type="image" id="gotoStationIcon" src="images/gotoStation.png" onclick="location.href='srch_station'">
	          <input type="image" id="gotoPlaceIcon" src="images/gotoPlace.png" name="more" onclick="location.href='srch_place'">
	        </div>
	    </div>
    	
    	<script>
    		var tLabels = ['์กํ', '์ฌ๋น', '์์ด', '๊ต๋', '๊ฐ๋ฝ์์ฅ'];
    		var tDatas = ['51.11', '50.0', '49.98', '49.68', '48.52'];
			
			
			var context = document
            .getElementById('myChart')
            .getContext('2d');
		
        var myChart = new Chart(context, {
            type: 'bar', // ์ฐจํธ์ ํํ
            data: { // ์ฐจํธ์ ๋ค์ด๊ฐ ๋ฐ์ดํฐ
                labels: tLabels,
                datasets: [
                    { //๋ฐ์ดํฐ
                        label: 'ํผ์ก๋ฅ  ์์5๊ฐ ์งํ์ฒ ์ญ', //์ฐจํธ ์ ๋ชฉ
                        fill: false, // line ํํ์ผ ๋, ์  ์์ชฝ์ ์ฑ์ฐ๋์ง ์์ฑ์ฐ๋์ง
                        data: tDatas,
                        backgroundColor: [
                            //์์
                        	'rgba(83, 130, 51, 0.8)',
                            'rgba(98, 153, 62, 0.8)',
                            'rgba(112, 173, 71, 0.8)',
                            'rgba(161, 196, 144, 0.7)',
                            'rgba(195, 216, 187, 0.7)'
                           
                        ],
                        borderColor: [
                            //๊ฒฝ๊ณ์  ์์
                        	'rgba(83, 130, 51, 1)',
                            'rgba(98, 153, 62, 1)',
                            'rgba(112, 173, 71, 1)',
                            'rgba(161, 196, 144, 1)',
                            'rgba(195, 216, 187, 1)'
                          
                        ],
                        borderWidth: 1 //๊ฒฝ๊ณ์  ๊ตต๊ธฐ
                    }
                ]
            },
            options: {
            	responsive : true,
            	
            	
                scales: {
                	xAxes: {
                		ticks: {
                			font: {Size : 25}
                		}
                	},
                    yAxes: {
                            ticks: {
                                beginAtZero: true
                            }
                        }
                }
            }
        });
        	
        </script>
    </main>
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