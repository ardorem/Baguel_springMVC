<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
  <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
  <link rel="stylesheet" href="${contextPath}/css/header_footer.css">
  <link rel="stylesheet" href="${contextPath}/css/register_ok.css">
  <title>๋ฐ๊ธ</title>
  <link rel="icon" href="${contextPath}/images/favicon.png">
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
      <div id="mainTitleUser">
        <h1>๋น๋ฐ๋ฒํธ ์ฐพ๊ธฐ</h1>
      </div>
      <div class="row" id="found">
        <div class="col-12">
          <h1>์์ ๋น๋ฐ๋ฒํธ๊ฐ ๋ฐ๊ธ๋์์ต๋๋ค</h1>
        </div>
        <div class="col-12" id="gap"></div>
        <div class="col-12">
          <div class="fs-4 p-3 bg-warning">
            ์์ ๋น๋ฐ๋ฒํธ : <span class="fw-semibold">${newPw }</span>
          </div>
        </div>
        <div class="col-12" id="gap"></div>
        <div class="col-12">
          <p class="fs-4 text">
            ๋ฐ๊ธ๋ ์์๋น๋ฐ๋ฒํธ๋ ๋ค์ ์กฐํ๊ฐ ๋ถ๊ฐ๋ฅํฉ๋๋ค<br>
            <b>๋ก๊ทธ์ธ ํ ๊ผญ ๋น๋ฐ๋ฒํธ๋ฅผ ๋ณ๊ฒฝํด ์ฃผ์ธ์</b>
          </p>
        </div>
        <div class="col-12" id="gap"></div>
        <div class="col-12" id="gap"></div>
        <div class="col-12">
          <a href="${pageContext.request.contextPath}/login" class="btn btn-outline-success"  id="linkAction">๋ก๊ทธ์ธ</a>
        </div>
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
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
    crossorigin="anonymous"></script>
</body>

</html>