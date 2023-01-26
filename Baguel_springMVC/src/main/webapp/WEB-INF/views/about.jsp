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
      <div id="mainPage">
        <section style="background-color: #F7F9FA;">
          <div id="about1">
            <div id="seoulImg">
              <img src="images/seoul.png">
            </div>
            <div id="seoulText">
              <h2 style="font-family: NanumHv";>
                수도권에 인구의 절반이 살아
                <br>
                사람으로 <span style="font-size: 50px; color: rgb(250, 95, 46);" >바글바글한 서울,</span>
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
                약속장소 정할 때
                <br>
                혼잡한 곳은 피하고 싶을 때
                <br>
                <span style="font-size: 50px; color: rgb(89, 164, 248);" >바글로 검색</span>
                해 보세요
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
                행사나 일정을
                <br>
                함께 <span style="font-size: 50px; color: rgb(250, 95, 46);" >공유</span>
                해 주세요
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