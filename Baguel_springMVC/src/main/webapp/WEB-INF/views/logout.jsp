<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="css/header_footer.css">
  <link rel="stylesheet" href="css/register_ok.css">
  
  <title>바글</title>
</head>

<body>
  <div id="container">
    <!-- ****************************************************************************** header & nav start-->
    <header>
      <a href="main">
        <div id="logo">
          <p>바글🚶‍♂️🚶🚶‍♀️</p>
        </div>
      </a>
      <div id="loginMenu">
		<c:choose>
			<c:when test="${userLogin eq null }">
	        	<a href="register">회원가입</a>
				<a href="login">로그인</a>
			</c:when>
			<c:otherwise>
				${userId }&nbsp;&nbsp;
				<a href="mypage">마이페이지</a>
				<a href="/baguel/logout.do">로그아웃</a>
			</c:otherwise>
		</c:choose>
    </header>
    <nav>
      <ul id="navi">
        <li><a href="#">조회</a>
          <ul>
            <li><a href="srch_station.html">역으로 조회</a></li>
            <li><a href="srch_place.html">장소로 조회</a></li>
          </ul>
        </li>
        <li><a href="cal_view.html">캘린더</a>
          <ul>
            <li><a href="cal_add">일정 등록</a></li>
            <li><a href="/baguel/list.do">등록된 일정</a></li>
            <li><a href="cal_view.html">캘린더 보기</a></li>
          </ul>
        </li>
        <li><a href="map">지도로 보기</a></li>
        <li><a href="#">이용 안내</a>
          <ul>
            <li><a href="about.html">about 바글</a></li>
          </ul>
        </li>
      </ul>
    </nav>
    <!-- ************************************************************************* header & nav end -->

    <!-- ******************************************************************************main start -->
    <main>
      <!-- !!! 여기부터 작성 !!! -->
     <div id="mainTitleUser">
        <h1>로그아웃 완료</h1>
      </div>
      <div id="addOk">
        <h1>로그아웃 되었습니다.<br>
          <span class="welcome">다음에 또봐요🖐️</span>
        </h1>
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