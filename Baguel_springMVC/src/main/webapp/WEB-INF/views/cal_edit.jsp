<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="css/header_footer.css">
  <link rel="stylesheet" href="css/cal_add.css">
  <script src="js/cal_add.js"></script>
  <title>๋ฐ๊ธ</title>
  <link rel="icon" href="images/favicon.png">
</head>

<body>
  <div id="container">
    <!-- ****************************************************************************** header & nav start-->
    <header>
      <a href="main" id="logo">
        <p>๋ฐ๊ธ๐ถโโ๏ธ๐ถ๐ถโโ๏ธ</p>
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
        <li><a href="#">์กฐํ</a>
          <ul>
            <li><a href="srch_station">์ญ์ผ๋ก ์กฐํ</a></li>
            <li><a href="srch_place">์ฅ์๋ก ์กฐํ</a></li>
          </ul>
        </li>
        <li><a href="cal_view">์บ๋ฆฐ๋</a>
          <ul>
            <li><a href="cal_add">์ผ์  ๋ฑ๋ก</a></li>
            <li><a href="cal_list">๋ฑ๋ก๋ ์ผ์ </a></li>
            <li><a href="cal_view">์บ๋ฆฐ๋ ๋ณด๊ธฐ</a></li>
          </ul>
        </li>
        <li><a href="map">์ง๋๋ก ๋ณด๊ธฐ</a></li>
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
        <h1>์ผ์  ๋ฑ๋ก</h1>
      </div>
      <div id="regEvent">
        <form action="edit_article" name="event_frm" method="post">
        <input type="hidden" name="userId" value="${userId }">
        <input type="hidden" name="boardNum" value="${boardNum }">
        
          <ul>
            <!-- eventFrom -->
            <li><label for="eventFrom">์์๋ ์ง ์ ํ</label></li>
            <li id="space-small"></li>
            <li><input type="date" id="eventFrom" name="eventFrom" value="${boardArticle.eventFrom}"></li>

            <!-- eventTo -->
            <li style="margin-top: 15px;"><label for="dateTo">์ข๋ฃ๋ ์ง ์ ํ</label></li>
            <li id="space-small"></li>
            <li><input type="date" id="eventTo" name="eventTo" value="${boardArticle.eventTo}"></li>
            <li class="leftTxt">* ์์์ผ๊ณผ ์ข๋ฃ์ผ์ด ๊ฐ๋ค๋ฉด, <span class="blueTxt">๋์ผํ๊ฒ ์๋ ฅ</span> ํด์ฃผ์ธ์</li>
            <li id="space"></li>

            <!-- eventPlace -->
            <li><label for="eventPlace">์ฅ์</label></li>
            <li id="space-small"></li>
            <li><input type="text" id="eventPlace" name="eventPlace" maxlength="20" value="${boardArticle.eventPlace}"></li>
            <li id="space"></li>

            <!-- eventType -->
            <li><label for="eventType">์ข๋ฅ</label></li>
            <li id="space-small"></li>
            <li>
              <select size="1" id="eventType" name="eventType">
                	<option value="none">* ์ข๋ฅ๋ฅผ ์ ํํด ์ฃผ์ธ์ *</option>
	              <c:choose >
	              	<c:when test="${boardArticle.eventType eq 'show' }">
		                <option value="show" selectecd>๊ณต์ฐ(๋ฎค์ง์ปฌ, ์ฐ๊ทน)</option>
	              	</c:when>
	              	<c:otherwise>
		                <option value="show">๊ณต์ฐ(๋ฎค์ง์ปฌ, ์ฐ๊ทน)</option>
	              	</c:otherwise>
	              </c:choose>
	              <c:choose>
	              	<c:when test="${boardArticle.eventType eq 'sports' }">
		                <option value="sports" selected>์คํฌ์ธ  ๊ฒฝ๊ธฐ</option>
	              	</c:when>
	              	<c:otherwise>
		                <option value="sports">์คํฌ์ธ  ๊ฒฝ๊ธฐ</option>
	              	</c:otherwise>
	              </c:choose>
	              <c:choose>
	              	<c:when test="${boardArticle.eventType eq 'concert' }">
		                <option value="concert" selected>์ฝ์ํธ</option>
	              	</c:when>
	              	<c:otherwise>
		                <option value="concert">์ฝ์ํธ</option>
	              	</c:otherwise>
	              </c:choose>
	              <c:choose>
	              	<c:when test="${boardArticle.eventType eq 'localFest' }">
		                <option value="localFest" selected>์ง์ญ ์ถ์ </option>
	              	</c:when>
	              	<c:otherwise>
		                <option value="localFest">์ง์ญ ์ถ์ </option>
	              	</c:otherwise>
	              </c:choose>
	              <c:choose>
	              	<c:when test="${boardArticle.eventType eq 'festival' }">
		                <option value="festival" selected>ํ์คํฐ๋ฒ</option>
	              	</c:when>
	              	<c:otherwise>
		                <option value="festival">ํ์คํฐ๋ฒ</option>
	              	</c:otherwise>
	              </c:choose>
	              <c:choose>
	              	<c:when test="${boardArticle.eventType eq 'exhibition' }">
		                <option value="exhibition" selected>๋ฏธ์ ์ ์</option>
	              	</c:when>
	              	<c:otherwise>
		                <option value="exhibition">๋ฏธ์ ์ ์</option>
	              	</c:otherwise>
	              </c:choose>
	              <c:choose>
	              	<c:when test="${boardArticle.eventType eq 'etc' }">
		                <option value="etc" selected>๊ธฐํ</option>
	              	</c:when>
	              	<c:otherwise>
		                <option value="etc">๊ธฐํ</option>
	              	</c:otherwise>
	              </c:choose>
              </select>
              <li id="space"></li>
            </li>

            <!-- event -->
            <li><label for="event">์ผ์ ์ด๋ฆ</label></li>
            <li id="space-small"></li>
            <li><input type="text" id="event" name="event" maxlength="100" value="${boardArticle.event}"></li>
            <li id="space"></li>

            <!-- eventDesc -->
            <li><label for="eventDesc">๊ฐ๋จํ ์ค๋ช</label></li>
            <li id="space-small"></li>
            <li><textarea name="eventDesc" id="eventDesc" maxlength="401" placeholder=" ์ถ๊ฐ๋ก ๋จ๊ธฐ์ค ๋ง์์ด ์๋ค๋ฉด ์ ์ด์ฃผ์ธ์ :)" 
              onkeyup="countTxt(eventDesc.value)">${boardArticle.eventDesc}</textarea></li>
            <li class="leftTxt"><span id="counter"></span> / 400</li>
            <li><div id="counter"></div></li>
            <li id="space"></li>
            <li id="space"></li>
            <li>
   		       <input type="button" value="์์ ํ๊ธฐ" onclick="addEventConfirm()"><br>
            </li>
            <li id="space"></li>
            <li>
        		 <input type="button" value="์ญ์ ํ๊ธฐ" onclick="location.href='deactive_article/${boardNum}'">
            </li>
          </ul>
        </form>
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
</body>

</html>