<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="css/header_footer.css">
<link rel="stylesheet" href="css/cal_list.css">
<title>바글</title>
<link rel="icon" href="images/favicon.png">
</head>

<body>
	<div id="container">
    <!-- ****************************************************************************** header & nav start-->
    <header>
      <a href="main" id="logo">
        <p>바글🚶‍♂️🚶🚶‍♀️</p>
        <div id="logoSmall">서울 주요지역 혼잡 예측 서비스</div>
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
        <li><a href="#">혼잡 예측</a>
          <ul>
            <li><a href="srch_station">역으로 조회</a></li>
            <li><a href="srch_place">장소로 조회</a></li>
          </ul>
        </li>
        <li><a href="cal_view">달력으로 조회</a>
          <ul>
            <li><a href="cal_view">달력으로 조회</a></li>
            <li><a href="cal_add">일정 등록 요청</a></li>
            <li><a href="cal_list">요청된 일정</a></li>
          </ul>
        </li>
        <li><a href="map">지도로 조회</a></li>
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
				<h1>등록된 일정</h1>
			</div>
			<div id="order" class="table-responsive">
				<h1>일정 추가요청 목록</h1>
				<table class="table table-hover">
					<tr>
						<th>No.</th>
						<th>작성일</th>
						<th>글 제목</th>
						<th>작성자</th>
						<th>처리여부</th>
						<th>조회수</th>
					</tr>
					<c:if test="${pagination['totalPages'] == 0}">
						<tr id="articleEmpty">
							<td colspan="5">아직 작성된 요청이 없습니다.</td>
						</tr>
					</c:if>
					
					<c:forEach items="${articles }" var="board" varStatus="status">
						<tr>
							<c:choose>
								<c:when test="${board.status eq '0' }">
									<td colspan="6" style="background: rgba(0, 0, 0, 0.1);">삭제된 글입니다</td>
								</c:when>
								<c:otherwise>
									<td>${(pagination['currentPage']-1) * 10 + status.index + 1}</td>
									<td>${board.writeDate }</td>
									<td>
										<a href="cal_list_view/${board.boardNum}">
											[${board.eventPlace }]${board.event } <c:if test="${board.editDate ne null}"><span style="color: grey;"> - 수정됨</span></c:if>
										</a>
										</td>
									<td>${board.userNick}</td>
									<c:if test="${board.approval ==0}" var="result">
										<td>처리중</td>
									</c:if> 
									<c:if test="${board.approval ==1}" var="result">
										<td id="complete">처리완료</td>
									</c:if>
									<td>${board.viewcount }</td>
								</c:otherwise>
							</c:choose>
						</tr>
					</c:forEach>
				</table>
				<div id="calAdd">
					<div id="paging">
					<form name="paging" action="cal_list" method="post">
							<c:if test="${pagination['currentPage'] > pagination['pagesToShow']}">
								<button name="page" id="page" value="${pagination['startPage'] - 1}">&laquo; 이전</button>
								<!-- 	&laquo : <<  //  &raquo; : >> -->
							</c:if>
							<c:forEach varStatus="status" begin="${pagination['startPage']}" end="${pagination['endPage']}">
								<c:choose>
									<c:when test="${pagination['currentPage'] eq status.index}">
										<button name="page" id="currentPage" value="${status.index }">${status.index }</button>
									</c:when>
									<c:otherwise>
										<button name="page" id="page" value="${status.index }">${status.index }</button>
									</c:otherwise>							
								</c:choose>
							</c:forEach>
							<c:if test="${pagination['endPage'] < pagination['totalPages']}">
								<button name="page" id="page" value="${pagination['endPage'] + 1}">다음 &raquo;</button>
							</c:if>
						</form>
					</div>
					<form action="cal_add">
						<input type="submit" value="일정 등록 요청하기">
					</form>
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
	  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
    crossorigin="anonymous"></script>
</body>

</html>