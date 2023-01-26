<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="css/header_footer.css">
  <link rel="stylesheet" href="css/register.css">
  <script src="js/members.js"></script>
  <title>바글</title>
</head>

<body>
  <div id="container">
    <!-- ****************************************************************************** header & nav start-->
    <header>
      <a href="main" id="logo">
        <p>바글🚶‍♂️🚶🚶‍♀️</p>
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
        <li><a href="#">조회</a>
          <ul>
            <li><a href="srch_station">역으로 조회</a></li>
            <li><a href="srch_place">장소로 조회</a></li>
          </ul>
        </li>
        <li><a href="cal_view">캘린더</a>
          <ul>
            <li><a href="cal_add">일정 등록</a></li>
            <li><a href="cal_list">등록된 일정</a></li>
            <li><a href="cal_view">캘린더 보기</a></li>
          </ul>
        </li>
        <li><a href="map">지도로 보기</a></li>
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
      <!-- !!! 여기부터 작성 !!! -->
      <div id="mainTitleUser">
        <h1>비밀번호 찾기🔍</h1>
      </div>
      <div id="regEvent">
        <form action="find_pw" name="found_pw" method="post">
          <ul>
            <li>
              <div id="informBig">
                '비밀번호 찾기'를 누르면<span class="regAccentBig"> "임시 비밀번호가 발급" </span>됩니다.<br>
              </div>
            </li>
            <li id="space"></li>
            <li id="space"></li>
            <li>
              <div class="rightTxt">
                <p>* 필수 입력사항</p>
              </div>
            </li>
            <!-- userId -->
            <li><label for="userId">아이디</label></li>
            <li id="space-small"></li>
            <li><input type="text" id="userId" name="userId" placeholder="영문 소문자/숫자, 4~16자" required maxlength="16"
                autofocus onkeyup="checkId(userId.value)"></li>
            <li>
              <div id="inform">영문 소문자/숫자, 4~16자</div>
            </li>
            <li>
              <div id="msgId"></div>
            </li>
            <li id="space"></li>
            <li id="space"></li>

            <!-- userName -->
            <li><label for="userName">이름</label></li>
            <li id="space-small"></li>
            <li><input id="text" name="userName" id="userName" maxlength="20" required
                onkeyup="checkName(userName.value)"></li>
            <li>
              <div id="inform">한글 2~5자</div>
            </li>
            <li>
              <div id="msgName"></div>
            </li>
            <li id="space"></li>

            <!-- userMail -->
            <li><label for="userMail">이메일</label></li>
            <li id="space-small"></li>
            <li><input type="email" name="userEmail" id="userMail" onkeyup="checkEmail(userMail.value)"></li>
            <li>
              <div id="msgEmail"></div>
            </li>
            <li id="space"></li>
            <li id="space"></li>
            <li id="space"></li>

          </ul>
          <input type="button" value="비밀번호 찾기" onclick="resetPwConfirm()">
        </form>
      </div>
    </main>
    <!-- ************************************************************************ main -->

    <!-- ******************************************************************************footer start -->
    <footer>
      <div id="bottomMenu">
        <ul>
          <li><a href="#">회사 소개</a></li>
          <li><a href="#">개인정보처리방침</a></li>
          <li><a href="#">이용약관</a></li>
          <li><a href="#">사이트맵</a></li>
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