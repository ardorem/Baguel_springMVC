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
        <h1>일정 등록</h1>
      </div>
      <div id="regEvent">
        <form action="edit_article" name="event_frm" method="post">
        <input type="hidden" name="userId" value="${userId }">
        <input type="hidden" name="boardNum" value="${boardNum }">
        
          <ul>
            <!-- eventFrom -->
            <li><label for="eventFrom">시작날짜 선택</label></li>
            <li id="space-small"></li>
            <li><input type="date" id="eventFrom" name="eventFrom" value="${boardArticle.eventFrom}"></li>

            <!-- eventTo -->
            <li style="margin-top: 15px;"><label for="dateTo">종료날짜 선택</label></li>
            <li id="space-small"></li>
            <li><input type="date" id="eventTo" name="eventTo" value="${boardArticle.eventTo}"></li>
            <li class="leftTxt">* 시작일과 종료일이 같다면, <span class="blueTxt">동일하게 입력</span> 해주세요</li>
            <li id="space"></li>

            <!-- eventPlace -->
            <li><label for="eventPlace">장소</label></li>
            <li id="space-small"></li>
            <li><input type="text" id="eventPlace" name="eventPlace" maxlength="20" value="${boardArticle.eventPlace}"></li>
            <li id="space"></li>

            <!-- eventType -->
            <li><label for="eventType">종류</label></li>
            <li id="space-small"></li>
            <li>
              <select size="1" id="eventType" name="eventType">
                	<option value="none">* 종류를 선택해 주세요 *</option>
	              <c:choose >
	              	<c:when test="${boardArticle.eventType eq 'show' }">
		                <option value="show" selectecd>공연(뮤지컬, 연극)</option>
	              	</c:when>
	              	<c:otherwise>
		                <option value="show">공연(뮤지컬, 연극)</option>
	              	</c:otherwise>
	              </c:choose>
	              <c:choose>
	              	<c:when test="${boardArticle.eventType eq 'sports' }">
		                <option value="sports" selected>스포츠 경기</option>
	              	</c:when>
	              	<c:otherwise>
		                <option value="sports">스포츠 경기</option>
	              	</c:otherwise>
	              </c:choose>
	              <c:choose>
	              	<c:when test="${boardArticle.eventType eq 'concert' }">
		                <option value="concert" selected>콘서트</option>
	              	</c:when>
	              	<c:otherwise>
		                <option value="concert">콘서트</option>
	              	</c:otherwise>
	              </c:choose>
	              <c:choose>
	              	<c:when test="${boardArticle.eventType eq 'localFest' }">
		                <option value="localFest" selected>지역 축제</option>
	              	</c:when>
	              	<c:otherwise>
		                <option value="localFest">지역 축제</option>
	              	</c:otherwise>
	              </c:choose>
	              <c:choose>
	              	<c:when test="${boardArticle.eventType eq 'festival' }">
		                <option value="festival" selected>페스티벌</option>
	              	</c:when>
	              	<c:otherwise>
		                <option value="festival">페스티벌</option>
	              	</c:otherwise>
	              </c:choose>
	              <c:choose>
	              	<c:when test="${boardArticle.eventType eq 'exhibition' }">
		                <option value="exhibition" selected>미술전시</option>
	              	</c:when>
	              	<c:otherwise>
		                <option value="exhibition">미술전시</option>
	              	</c:otherwise>
	              </c:choose>
	              <c:choose>
	              	<c:when test="${boardArticle.eventType eq 'etc' }">
		                <option value="etc" selected>기타</option>
	              	</c:when>
	              	<c:otherwise>
		                <option value="etc">기타</option>
	              	</c:otherwise>
	              </c:choose>
              </select>
              <li id="space"></li>
            </li>

            <!-- event -->
            <li><label for="event">일정이름</label></li>
            <li id="space-small"></li>
            <li><input type="text" id="event" name="event" maxlength="100" value="${boardArticle.event}"></li>
            <li id="space"></li>

            <!-- eventDesc -->
            <li><label for="eventDesc">간단한 설명</label></li>
            <li id="space-small"></li>
            <li><textarea name="eventDesc" id="eventDesc" maxlength="401" placeholder=" 추가로 남기실 말씀이 있다면 적어주세요 :)" 
              onkeyup="countTxt(eventDesc.value)">${boardArticle.eventDesc}</textarea></li>
            <li class="leftTxt"><span id="counter"></span> / 400</li>
            <li><div id="counter"></div></li>
            <li id="space"></li>
            <li id="space"></li>
            <li>
   		       <input type="button" value="수정하기" onclick="addEventConfirm()"><br>
            </li>
            <li id="space"></li>
            <li>
        		 <input type="button" value="삭제하기" onclick="location.href='deactive_article/${boardNum}'">
            </li>
          </ul>
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