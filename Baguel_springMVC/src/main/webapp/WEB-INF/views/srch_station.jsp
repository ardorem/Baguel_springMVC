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
      <!-- !!! ์ฌ๊ธฐ๋ถํฐ ์์ฑ !!! -->
      <div id="mainTitleUser">
        <h1>์งํ์ฒ ์ญ์ผ๋ก ์กฐํ</h1>
      </div>
      <div id="search">
        <!--ํ์ formํ๊ทธ๋ก ๋ณ๊ฒฝํ๊ธฐ-->
        <form id="srch_station" name="srchS_form" method="GET" action="result_station">
        <div id="Date">
          <h4>๋ ์ง ์ ํ</h4>
          <input id="selectDate" name="selectDate" type="date" required value="${today }">
        </div>
        <div id="selectPlace">
            <h4>์งํ์ฒ ์ญ ์ ํ</h4>
            <select id="line" name="line" onchange="stationChange(this)">
              <option value="ํธ์ ">ํธ์ </option>
              <option value="1ํธ์ ">1ํธ์ </option>
              <option value="2ํธ์ ">2ํธ์ </option>
              <option value="3ํธ์ ">3ํธ์ </option>
              <option value="4ํธ์ ">4ํธ์ </option>
              <option value="5ํธ์ ">5ํธ์ </option>
              <option value="6ํธ์ ">6ํธ์ </option>
              <option value="7ํธ์ ">7ํธ์ </option>
              <option value="8ํธ์ ">8ํธ์ </option>
            </select>
            <!-- <input type="text" id="stationName" name="stationName" placeholder="์กฐํํ  ์งํ์ฒ ์ญ์ ์ ํํ์ธ์.">																							 -->
            <select id ="stationName" name="stationName">
              <option value="none">ํธ์ ์ ์ฐ์  ์ ํํด ์ฃผ์ธ์</option>
            </select>
        </div>
        
        <div>
          <button id="searchIcon" type="button" onclick="stationSrchConfirm()"><img
              id="btnimg" src="images/search.png" ></button>
        </div>
        </form>
      </div>
      <div id="subwayLinemap">
    		<!-- <h4>์งํ์ฒ ๋ธ์ ๋</h4> -->
    		<img id="subwayImg" src="images/subway.png">
  		</div>
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