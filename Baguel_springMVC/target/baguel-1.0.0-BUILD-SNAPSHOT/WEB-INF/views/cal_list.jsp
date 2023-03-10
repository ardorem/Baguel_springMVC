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
			<div id="mainTitleUser">
				<h1>์์ฒญ๋ ์ผ์ </h1>
			</div>
			<div id="order" class="table-responsive">
				<h1>์ผ์  ์ถ๊ฐ์์ฒญ ๋ชฉ๋ก</h1>
				<table class="table table-hover">
					<tr>
						<th>No.</th>
						<th>์์ฑ์ผ</th>
						<th>๊ธ ์ ๋ชฉ</th>
						<th>์์ฑ์</th>
						<th>์ฒ๋ฆฌ์ฌ๋ถ</th>
						<th>์กฐํ์</th>
					</tr>
					<c:if test="${pagination['totalPages'] == 0}">
						<tr id="articleEmpty">
							<td colspan="5">์์ง ์์ฑ๋ ์์ฒญ์ด ์์ต๋๋ค.</td>
						</tr>
					</c:if>
					
					<c:forEach items="${articles }" var="board" varStatus="status">
						<tr>
							<c:choose>
								<c:when test="${board.status eq '0' }">
									<td colspan="6" style="background: rgba(0, 0, 0, 0.1);">์ญ์ ๋ ๊ธ์๋๋ค</td>
								</c:when>
								<c:otherwise>
									<td>${(pagination['currentPage']-1) * 10 + status.index + 1}</td>
									<td>${board.writeDate }</td>
									<td>
										<a href="cal_list_view/${board.boardNum}">
											[${board.eventPlace }]${board.event } <c:if test="${board.editDate ne null}"><span style="color: grey;"> - ์์ ๋จ</span></c:if>
										</a>
										</td>
									<td>${board.userNick}</td>
									<c:if test="${board.approval ==0}" var="result">
										<td>์ฒ๋ฆฌ์ค</td>
									</c:if> 
									<c:if test="${board.approval ==1}" var="result">
										<td id="complete">์ฒ๋ฆฌ์๋ฃ</td>
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
								<button name="page" id="page" value="${pagination['startPage'] - 1}">&laquo; ์ด์ </button>
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
								<button name="page" id="page" value="${pagination['endPage'] + 1}">๋ค์ &raquo;</button>
							</c:if>
						</form>
					</div>
					<form action="cal_add">
						<input type="submit" value="์ผ์  ๋ฑ๋ก ์์ฒญํ๊ธฐ">
					</form>
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
	  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
    crossorigin="anonymous"></script>
</body>

</html>