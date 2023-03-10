<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="css/header_footer.css">
  <link rel="stylesheet" href="css/about.css">
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
      <div id="mainPage">
        <section style="background-color: #F7F9FA;">
          <div id="about1">
            <div id="seoulImg">
              <img src="images/seoul.png">
            </div>
            <div id="seoulText">
              <h2 style="font-family: NanumHv";>
                ์๋๊ถ์ ์ธ๊ตฌ์ ์ ๋ฐ์ด ์ด์
                <br>
                ์ฌ๋์ผ๋ก <span style="font-size: 50px; color: rgb(250, 95, 46);" >๋ฐ๊ธ๋ฐ๊ธํ ์์ธ,</span>
              </h2>
            </div>
          </div>
        </section>
        <section>
          <div id="about2">
            <div id="useToBageul">
              <img src="images/usetoBageul.png">
            </div>
            <div id="useToBageulText">
              <h2 style="font-family: NanumHv";>
                ์ฝ์์ฅ์ ์ ํ  ๋
                <br>
                ํผ์กํ ๊ณณ์ ํผํ๊ณ  ์ถ์ ๋
                <br>
                <span style="font-size: 50px; color: rgb(89, 164, 248);" >๋ฐ๊ธ๋ก ๊ฒ์</span>
                ํด ๋ณด์ธ์
              </h2>
            </div>
          </div>
        </section>
        <section>
          <div id="about3">
            <div id="eventSharing">
              <img src="images/eventSharing.png">
            </div>
            <div id="eventSharingText">
              <h2 style="font-family: NanumHv";>
                ํ์ฌ๋ ์ผ์ ์
                <br>
                ํจ๊ป <span style="font-size: 50px; color: rgb(250, 95, 46);" >๊ณต์ </span>
                ํด ์ฃผ์ธ์
              </h2>
            </div>
          </div>
        </section>
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