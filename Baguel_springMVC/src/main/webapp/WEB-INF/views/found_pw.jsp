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
  <title>바글</title>
  <link rel="icon" href="${contextPath}/images/favicon.png">
</head>

<body>
  <div id="container">
    <!-- ****************************************************************************** header & nav start-->
    <header>
      <a href="${contextPath}/main" id="logo">
        <p>바글🚶‍♂️🚶🚶‍♀️</p>
        <div id="logoSmall">서울 주요지역 혼잡 예측 서비스</div>
      </a>
      <div id="loginMenu">
		<c:choose>
			<c:when test="${userLogin eq 'logined' }">
				${userId }&nbsp;&nbsp;
				<a href="${contextPath}/mypage">마이페이지</a>
				<a href="${contextPath}/logout">로그아웃</a>
			</c:when>
			<c:otherwise>
	      <a href="${contextPath}/register">회원가입</a>
				<a href="${contextPath}/login">로그인</a>
			</c:otherwise>
		</c:choose>
		</div>
    </header>
    <nav>
      <ul id="navi">
        <li><a href="#">혼잡 예측</a>
          <ul>
            <li><a href="${contextPath}/srch_station">역으로 조회</a></li>
            <li><a href="${contextPath}/srch_place">장소로 조회</a></li>
          </ul>
        </li>
        <li><a href="${contextPath}/cal_view">달력으로 조회</a>
          <ul>
            <li><a href="${contextPath}/cal_view">달력으로 조회</a></li>
            <li><a href="${contextPath}/cal_add">일정 등록 요청</a></li>
            <li><a href="${contextPath}/cal_list">요청된 일정</a></li>
          </ul>
        </li>
        <li><a href="${contextPath}/map">지도로 조회</a></li>
        <li><a href="#">이용 안내</a>
          <ul>
            <li><a href="${contextPath}/about">about 바글</a></li>
          </ul>
        </li>
      </ul>
    </nav>
    <!-- ************************************************************************* header & nav end -->

    <!-- ******************************************************************************main start -->
    <main>
      <div id="mainTitleUser">
        <h1>비밀번호 찾기</h1>
      </div>
      <div class="row" id="found">
        <div class="col-12">
          <h1>임시 비밀번호가 발급되었습니다</h1>
        </div>
        <div class="col-12" id="gap"></div>
        <div class="col-12">
          <div class="fs-4 p-3 bg-warning">
            임시 비밀번호 : <span class="fw-semibold">${newPw }</span>
          </div>
        </div>
        <div class="col-12" id="gap"></div>
        <div class="col-12">
          <p class="fs-4 text">
            발급된 임시비밀번호는 다시 조회가 불가능합니다<br>
            <b>로그인 후 꼭 비밀번호를 변경해 주세요</b>
          </p>
        </div>
        <div class="col-12" id="gap"></div>
        <div class="col-12" id="gap"></div>
        <div class="col-12">
          <a href="${pageContext.request.contextPath}/login" class="btn btn-outline-success"  id="linkAction">로그인</a>
        </div>
      </div>
    </main>
    <!-- ************************************************************************ main -->

    <!-- ******************************************************************************footer start -->
    <footer>
      <div id="bottomMenu">
        <ul id="footprint">
          <li>팀 프로젝트</li>
          <li>문인기 / moonpop6@daum.net</li>
          <li>변예진 / byejin.9738@gmail.com</li>
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
            <li>본 사이트는 '네이버'에서 제작한 '나눔스퀘어 네오'를 사용하고 있습니다.</li>
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