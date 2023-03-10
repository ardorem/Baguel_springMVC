<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
  <link rel="stylesheet" href="${contextPath}/css/header_footer.css">
  <link rel="stylesheet" href="${contextPath}/css/register_ok.css">
  <link rel="icon" href="${contextPath}/images/favicon.png">
  <title>๋ฐ๊ธ</title>
</head>

<body>
  <div id="container">
    <!-- ****************************************************************************** header & nav start-->
    <header>
      <a href="${contextPath}/main" id="logo">
        <p>๋ฐ๊ธ๐ถโโ๏ธ๐ถ๐ถโโ๏ธ</p>
        <div id="logoSmall">์์ธ ์ฃผ์์ง์ญ ํผ์ก ์์ธก ์๋น์ค</div>
      </a>
      <div id="loginMenu">
		<c:choose>
			<c:when test="${userLogin eq 'logined' }">
				${userId }&nbsp;&nbsp;
				<a href="${contextPath}/mypage">๋ง์ดํ์ด์ง</a>
				<a href="${contextPath}/logout">๋ก๊ทธ์์</a>
			</c:when>
			<c:otherwise>
	      <a href="${contextPath}/register">ํ์๊ฐ์</a>
				<a href="${contextPath}/login">๋ก๊ทธ์ธ</a>
			</c:otherwise>
		</c:choose>
		</div>
    </header>
    <nav>
      <ul id="navi">
        <li><a href="#">ํผ์ก ์์ธก</a>
          <ul>
            <li><a href="${contextPath}/srch_station">์ญ์ผ๋ก ์กฐํ</a></li>
            <li><a href="${contextPath}/srch_place">์ฅ์๋ก ์กฐํ</a></li>
          </ul>
        </li>
        <li><a href="${contextPath}/cal_view">๋ฌ๋ ฅ์ผ๋ก ์กฐํ</a>
          <ul>
            <li><a href="${contextPath}/cal_view">๋ฌ๋ ฅ์ผ๋ก ์กฐํ</a></li>
            <li><a href="${contextPath}/cal_add">์ผ์  ๋ฑ๋ก ์์ฒญ</a></li>
            <li><a href="${contextPath}/cal_list">์์ฒญ๋ ์ผ์ </a></li>
          </ul>
        </li>
        <li><a href="${contextPath}/map">์ง๋๋ก ์กฐํ</a></li>
        <li><a href="#">์ด์ฉ ์๋ด</a>
          <ul>
            <li><a href="${contextPath}/about">about ๋ฐ๊ธ</a></li>
          </ul>
        </li>
      </ul>
    </nav>
    <!-- ************************************************************************* header & nav end -->

    <!-- ******************************************************************************main start -->
    <main>
      <!-- !!! ์ฌ๊ธฐ๋ถํฐ ์์ฑ !!! -->
     <div id="mainTitleUser">
        <h1>์ญ์  ์๋ฃ</h1>
      </div>
      <div id="addOk">
        <h1>์์ฒญ๊ธ์ด ์ญ์  ๋์์ต๋๋ค.
        </h1>
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
						<li><a href="#"><img src="${pageContext.request.contextPath}/images/sns-1.png"></a></li>
						<li><a href="#"><img src="${pageContext.request.contextPath}/images/sns-2.png"></a></li>
						<li><a href="#"><img src="${pageContext.request.contextPath}/images/sns-3.png"></a></li>
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