<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="css/header_footer.css">
  <link rel="stylesheet" href="css/register.css">
<!--   <link rel="stylesheet" href="css/modify.css"> -->
 <script src="js/members.js"></script>
  <title>๋ฐ๊ธ</title>
    <link rel="icon" href="images/favicon.png">
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
      <div id="mainTitleModify">
        <h1>ํ์์ ๋ณด ์์ </h1>
      </div>
      <div id="regEvent">
        <form action="modify" name="reg_frm" method="post">
          <input type="hidden" name="userId" value="${userId }">
          <ul>
            <li>
              <div class="rightTxt">
                <p>* ํ์ ์๋ ฅ์ฌํญ</p>
              </div>
            </li>
            <!-- userId -->
            <li class="title">์์ด๋</li>
            <li id="space-small"></li>

            <li class="content">${userId }</li>
            <li id="space"></li>
			
			          <!-- userPw -->
            <li><label for="userPw">๋น๋ฐ๋ฒํธ</label></li>
            <li id="space-small"></li>
            <li><input type="password" id="userPw" name="userPw" maxlength="16"
                placeholder="์๋ฌธ ๋๋ฌธ์/์๋ฌธ์/์ซ์/ํน์๋ฌธ์ ์กฐํฉ, 8~16์" required onkeyup="checkPw(userPw.value, event)"></li>
            <li id="space-small"></li>
            <li><input type="password" id="userPw_check" name="userPw_check" maxlength="16" placeholder="๋น๋ฐ๋ฒํธ ํ์ธ"
                required onkeyup="checkCapsLock(event)"></li>
            <li>
              <div id="inform">์๋ฌธ ๋๋ฌธ์/์๋ฌธ์/์ซ์/ํน์๋ฌธ์ ์กฐํฉ, 8~16์<br>์๋ ฅ ๊ฐ๋ฅํ ํน์๋ฌธ์: !@#$%^*+=-</div>
            </li>
            <li>
              <div id="msgPw"></div>
            </li>
            <li>
              <div id="msgCapslock"></div>
            </li>
            <li id="space"></li>
            <li id="space"></li>

            <!-- userName -->
            <li><label for="userName">์ด๋ฆ</label></li>
            <li id="space-small"></li>
            <li><input id="text" name="userName" id="userName" value="${userName }" maxlength="20" required
                onkeyup="checkName(userName.value)"></li>
            <li>
              <div id="inform">ํ๊ธ 2~5์</div>
            </li>
            <li>
              <div id="msgName"></div>
            </li>
            <li id="space"></li>

            <!-- userMail -->
            <li><label for="userMail">์ด๋ฉ์ผ</label></li>
            <li id="space-small"></li>
            <li><input type="email" name="userEmail" id="userMail" value="${userEmail }" onkeyup="checkEmail(userMail.value)"></li>
            <li>
              <div id="inform">'์ด๋ฆ'๊ณผ '์ด๋ฉ์ผ'์ <span class="regAccent">์์ด๋-๋น๋ฐ๋ฒํธ ์ฐพ๊ธฐ</span>์ ์ด์ฉ๋ฉ๋๋ค.<br><span
                  class="regAccent">์ ์คํ๊ฒ ์๋ ฅํด ์ฃผ์ธ์</span></div>
            </li>
            <li>
              <div id="msgEmail"></div>
            </li>
            <li id="space"></li>
            <li id="space"></li>
            <li id="space"></li>

            <!-- userNick -->
            <li><label for="userNick">๋๋ค์</label></li>
            <li id="space-small"></li>
            <li><input type="text" name="userNick" id="userNick" value="${userNick }" maxlength="16" required
                onkeyup="checkNickName(userNick.value)"></li>
            <li>
              <div id="inform">์๋ฌธ ๋๋ฌธ์/์๋ฌธ์/์ซ์ ์ฌ์ฉ๊ฐ๋ฅ, 2~16์</div>
            </li>
            <li>
              <div id="msgNickName"></div>
            </li>
            <li id="space"></li>
            <li id="space"></li>
            <li id="space"></li>
            
            <li><input type="button" value="ํ์์ ๋ณด ์์ " onclick="updateInfoConfirm()"><br></li>
            <li id="space"></li>
            <li><input type="button" value="์ทจ์" onclick="location.href='mypage'"></li>
            <li id="space"></li>
            <li id="space"></li>
            <li id="space"></li>
            <li id="space"></li>
            <li><input type="button" value="ํ์ ํํด" onclick="deactive()"></li>
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