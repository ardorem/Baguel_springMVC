<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- BootStrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header_footer.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/cal_list_view.css">
<link rel="icon" href="${contextPath}/images/favicon.png">
<title>๋ฐ๊ธ</title>
</head>
<body>
	<div id="container">
		<!-- ****************************************************************************** header & nav start-->
		<header>
			<a href="${pageContext.request.contextPath}/main">
				<div id="logo">
					<p>๋ฐ๊ธ๐ถโโ๏ธ๐ถ๐ถโโ๏ธ</p>
				</div>
			</a>
			<div id="loginMenu">
				<c:choose>
					<c:when test="${userId eq null }">
						<a href="register">ํ์๊ฐ์</a>
						<a href="login">๋ก๊ทธ์ธ</a>
					</c:when>
					<c:otherwise>
				${userId }&nbsp;&nbsp;
				<a href="mypage">๋ง์ดํ์ด์ง</a>
						<a href="/baguel/logout.do">๋ก๊ทธ์์</a>
					</c:otherwise>
				</c:choose>
			</div>
		</header>
		<nav>
			<ul id="navi">
				<li><a href="#">์กฐํ</a>
					<ul>
						<li><a href="srch_station.html">์ญ์ผ๋ก ์กฐํ</a></li>
						<li><a href="srch_place.html">์ฅ์๋ก ์กฐํ</a></li>
					</ul></li>
				<li><a href="cal_view.html">์บ๋ฆฐ๋</a>
					<ul>
						<li><a href="${pageContext.request.contextPath}/cal_add">์ผ์  ๋ฑ๋ก</a></li>
						<li><a href="/baguel/list.do?page=1">๋ฑ๋ก๋ ์ผ์ </a></li>
						<li><a href="cal_view.html">์บ๋ฆฐ๋ ๋ณด๊ธฐ</a></li>
					</ul></li>
				<li><a href="map">์ง๋๋ก ๋ณด๊ธฐ</a></li>
				<li><a href="#">์ด์ฉ ์๋ด</a>
					<ul>
						<li><a href="about.html">about ๋ฐ๊ธ</a></li>
					</ul></li>
			</ul>
		</nav>
		<!-- ************************************************************************* header & nav end -->

		<!-- ******************************************************************************main start -->
		<main>
			<!-- !!! ์ฌ๊ธฐ๋ถํฐ ์์ฑ !!! -->
			<div id="mainTitleUser">
				<h1>๊ฒ์๊ธ ๋ณด๊ธฐ</h1>
			</div>
			<div id="regEvent" class="container">
				<!----------------------------------------------------------------------------------------------- ์ด๋ฒคํธ ์ด๋ฆ -->
				<div class="row" id="eventTitle">
					<div class="col-md-12">
						<span class="badge text-bg-dark">์ด๋ฒคํธ ์ด๋ฆ</span>
						<h2>
							[${boardArticle.eventPlace}]<br>${boardArticle.event}</h2>
					</div>
				</div>

				<!----------------------------------------------------------------------------------------------- ์ด๋ฒคํธ ์ ๋ณด -->
				<div class="row" id="eventInfo">

					<div class="col-md-4" id="infoBadge">
						<span class="badge text-bg-light">${boardArticle.eventType}</span>
					</div>

					<div class="col-md-4" id="infoBadge">
						<span class="badge text-bg-light">${boardArticle.eventFrom}์์</span>
					</div>

					<div class="col-md-4" id="infoBadge">
						<span class="badge text-bg-light">${boardArticle.eventTo}์ข๋ฃ</span>
					</div>

				</div>
				<!----------------------------------------------------------------------------------------------- ์์ฑ์, ์กฐํ์ -->
				<div class="row">

					<div class="col-md-6">
						<p class="fs-4">
							์์ฑ์ <span class="writer">${boardArticle.userNick}&nbsp;</span>
							<c:if test="${boardArticle.userId == userId}" var="result">
								<span class="badge text-bg-warning">๋ด๊ฐ ์์ฑํ ์์ฒญ</span>
							</c:if>
						</p>
						<p class="fs-6">
							์์ฑ์ผ ${boardArticle.writeDate}<br>
							<c:if test="${boardArticle.editDate != null}" var="result">
								<span class="text-secondary"> ์์ ์ผ ${boardArticle.editDate} </span>
							</c:if>
						</p>
					</div>

					<div class="col-md-6" id="viewCount">์กฐํ์ :
						${boardArticle.viewcount}</div>

					<div class="col-md-12">
						<hr>
					</div>
				</div>
				<!----------------------------------------------------------------------------------------------- ์ถ๊ฐ ์ฝ๋ฉํธ -->
				<div class="row">
					<div class="col-md-12" id="eventDesc">
						<span class="badge text-bg-dark">์ถ๊ฐ ์ฝ๋ฉํธ</span>
						<c:if test="${boardArticle.eventDesc eq null}" var="result">
							<h3>์์ฑ์์ ์ถ๊ฐ ์ฝ๋ฉํธ๊ฐ ์์ต๋๋ค.</h3>
						</c:if>
						<c:if test="${boardArticle.eventDesc ne null}" var="result">
							<p class="fs-4">&nbsp;${boardArticle.eventDesc}</p>
						</c:if>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12" id="eventDesc">
						<span class="badge text-bg-dark">๊ด๋ฆฌ์ ๋ฉ์์ง</span>
						<c:if test="${boardArticle.adminMSG == null}" var="result">
							<h3>๊ด๋ฆฌ์์ ๋ฉ์์ง๊ฐ ์์ต๋๋ค.</h3>
						</c:if>
						<c:if test="${boardArticle.adminMSG != null}" var="result">
							<p class="fs-4">&nbsp;${boardArticle.adminMSG}</p>
						</c:if>
					</div>
				</div>
				<div class="row">
					<div class="col-md-8">
						<!-- ๊ธ ์์ฑ์๊ฐ ์ ์ํ ๊ฒฝ์ฐ ์์  ๋ฒํผ -->
						<c:if test="${boardArticle.userId == userId}" var="result">
							<!-- ****************************Button trigger modal -->
							<button type="button" id="buttons" class="btn btn-primary"
								data-bs-toggle="modal" data-bs-target="#modalEfect">๊ธ
								์์ ํ๊ธฐ</button>

							<!-- Modal -->
							<div class="modal fade" id="modalEfect" tabindex="-1"
								aria-labelledby="modalEfectLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h1 class="modal-title fs-5" id="modalEfectLabel">์์  ํ์ธ</h1>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">์ ๋ง ์์ ํ์๊ฒ ์ด์?</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-bs-dismiss="modal">์ทจ์</button>
											<form action="${pageContext.request.contextPath}/edit_article" method="get">
												<input type="hidden" name="boardNum" value="${boardNum }">
												<button type="submit" class="btn" id="edit_btn">๊ธ
													์์ ํ๊ธฐ</button>
											</form>
										</div>
									</div>
								</div>
							</div>
							<!-- *****************************************************Button trigger modal -->
						</c:if>
					</div>

					<div class="col-md-4">
						<!-- <span class="badge text-bg-secondary" id="approval">์ฒ๋ฆฌ์ </span> -->
						<c:if test="${boardArticle.approval == 1}" var="result">
							<span class="badge text-bg-dark" id="approval">์ฒ๋ฆฌ์๋ฃ</span>
						</c:if>
						<c:if test="${boardArticle.approval == 0}" var="result">
							<span class="badge text-bg-light" id="approval">์ฒ๋ฆฌ์ค</span>
						</c:if>
					</div>
				</div>

				<div class="row">
					<div class="col-12">
						<hr>
					</div>
				</div>

				<!-- **************************************************************************************************************************** -->
				<!-- ********************************************** ๋๊ธ ์์ ******************************************************************* -->
				<!-- **************************************************************************************************************************** -->
				<div id="comments">
					<!-- ๋๊ธ ์ ์ฒด๋ฅผ ๊ฐ์ธ๋ div -->

					<!--****************************************************************************************** comment -->
					<!-- ************************************************************************************************* -->
					<c:if test="${parentComments.size() eq 0 }">
						<div class="row">
							<div class="col-12">๋๊ธ</div>
							<div class="col-12">
								<h3>์์ง ๋ฑ๋ก๋ ๋๊ธ์ด ์์ต๋๋ค.</h3>
							</div>
						</div>
					</c:if>

					<c:forEach items="${parentComments }" var="parent"
						varStatus="status">
						<c:choose>
							<c:when test="${parent.status eq 0}">
								<div class="row" id="comment">
									</divclass>
									<div class="col-12" id="deleted">
										<h5>์ญ์ ๋ ๋๊ธ์๋๋ค.</h5>
									</div>
									<div class="col-12">
										<hr>
									</div>
								</div>
							</c:when>

							<c:otherwise>
								<c:set var="i" value="${i+1 }" />
								<c:set var="counter" value="${i-1 }" />
								<!-- *********************************************************************************************** -->
								<!--******************************************** ๋๊ธ ์์ -->
								<div id="comment">
									<div class="row">
										<!-- ๋๊ธ ์์  form -->
										<form method="post" action="${pageContext.request.contextPath}/edit_comment">
											<input type="hidden" name="commentNum" value="${parent.commentNum }">
											<input type="hidden" name="boardNum" value="${boardNum}">
											<div class="col-12">
												<p class="fs-5 fw-bold">
													${parent.userId}&nbsp;
													<!-- ๋๊ธ์ด ๋ฌ๋ฆฐ ์๊ฐ badge -->
													<span class="badge rounded-pill text-bg-secondary">${parent.writeDate}</span>&nbsp;
													<!--------------------------------- ๋๊ธ์ด ๋ฌ๋ฆฐ ์๊ฐ badge fin. -->
													<c:if test="${parent.isEdited eq '1'}">
														<!-- ์์ ๋ ๋๊ธ์ ๊ฒฝ์ฐ badge -->
														<span class="badge rounded-pill text-bg-secondary">์์ ๋จ</span>&nbsp;
													<!--------------------------------- ์์ ๋ ๋๊ธ์ ๊ฒฝ์ฐ badge fin. -->
													</c:if>
													<c:if test="${parent.userId eq boardArticle.userId}">
														<!-- ํด๋น ๊ธ์ ์์ฑ์์ธ ๊ฒฝ์ฐ badge -->
														<span class="badge rounded-pill text-bg-warning">์์ฑ์</span>
														<!--------------------------------- ํด๋น ๊ธ์ ์์ฑ์์ธ ๊ฒฝ์ฐ badge fin. -->
													</c:if>
												</p>
											</div>
											<div class="replyarea">
												<div class="col-12 lh-base">
													<textarea class="innerReply" id="innerReply${counter }"
														maxlength="501" name="content"
														onkeyup="countComment(this.value, ${counter })" readonly>${parent.content}</textarea>
												</div>
											</div>
											<div class="col-12">
												<div class="addreplybtn">
													<button type="button" class="btn btn-outline-secondary"
														id="addReplyBtn" onclick="show_reply(${counter })">๋ต๊ธ
													</button>
													<c:if test="${parent.userId eq userId}">

														<!---------------------------------- ์ ์ํ ์ ์ ๊ฐ ์์ฑํ ๋๊ธ์ผ ๊ฒฝ์ฐ ์์  ๊ฐ๋ฅ -->
														<button type="button" class="btn btn-outline-secondary"
															id="editBtn" onclick="showedit(${counter })">์์ </button>
													</c:if>
												</div>
												<%-- 												<c:if test="${parent.id eq userId}"> --%>
												<div class="replyBtn">
													<span class="badge rounded-pill text-bg-secondary"
														id="countBadge1"><span class="counter"></span> /
														500 </span>
													<button type="submit" class="btn btn-outline-success"
														id="editConfirmComment">๋๊ธ ์์ </button>
													<a href="${pageContext.request.contextPath}/delete_comment/${boardNum}/${parent.commentNum }"
														class="btn btn-outline-danger" id="deleteComment">
														๋๊ธ ์ญ์ 
													</a>
													<button type="button" class="btn btn-outline-secondary"
														id="editCancel" onclick="cancelEdit()">์ทจ์</button>
												</div>
												<%-- 												</c:if> --%>
												<!---------------------------------------------------- ์ ์ํ ์ ์ ๊ฐ ์์ฑํ ๋๊ธ์ผ ๊ฒฝ์ฐ ์์  ๊ฐ๋ฅ fin.-->
											</div>
										</form>

										<!-- **************************************************************************************** reply -->
										<!--  id="commentTextarea0", count_reply(commentTextarea0.value, 0) -->
										<div class="row">
											<form name="" method="post"
												action="/baguel/add_child_comment.do">
												<input type="hidden" name="parentComment"
													value="${parent.commentNum}">
												<div class="addReply">
													<div class="col-12">
														<div class="form-floating" id="leaveComment">
															<textarea class="form-control" placeholder="activate"
																id="commentTextarea${counter }" maxlength="501"
																name="content"
																onkeyup="count_reply(this.value, ${counter })"></textarea>
															<label for="commentTextarea${counter }">${userNick }</label>
														</div>
													</div>
													<div class="col-12" id="bottomMenu">
														<span class="badge rounded-pill text-bg-secondary"
															id="countBadge1"><span class="counterreply"></span>
															/ 500</span>&nbsp;
														<button type="submit" class="btn btn-outline-success"
															id="confirmReply">๋ฑ๋ก</button>
														<button type="button" class="btn btn-outline-secondary"
															id="editCancel" onclick="cancelEdit()">์ทจ์</button>
													</div>
												</div>
												<div class="col-12">
													<hr>
												</div>
											</form>
										</div>
										<!-- *********************************************************************************************** -->
									</div>
								</div>
								<!--******************************************** ๋๊ธ ๋ -->
								<!-- *********************************************************************************************** -->
								<!-- /////////////////////////////////////////////////////////////////////////////////////////////// -->
								<!-- *********************************************************************************************** -->
								<!--********************************************************************************** ๋๋๊ธ start -->
								<c:forEach items="${childComments }" var="child">
									<c:if test="${child.parentComment eq parent.commentNum }">
										<c:choose>
											<c:when test="${child.status eq 0}">
												<div class="row" id="reply">
													<div class="col-12" id="deleted">
														<h5>์ญ์ ๋ ๋๊ธ์๋๋ค.</h5>
													</div>
													<div class="col-12">
														<hr>
													</div>
												</div>
											</c:when>
											<c:otherwise>
												<c:set var="i" value="${i+1 }" />
												<c:set var="counter" value="${i-1 }" />

												<div id="reply">
													<div class="row">
														<form name="" method="post" action="${pageContext.request.contextPath}/edit_comment">
															<input type="hidden" name="commentNum" value="${child.commentNum }">
															<input type="hidden" name="boardNum" value="${boardNum}">
															<div class="col-12">
																<p class="fs-5 fw-bold">
																	${child.userId}&nbsp;
																	<!-- ๋๊ธ์ด ๋ฌ๋ฆฐ ์๊ฐ badge -->
																	<span class="badge rounded-pill text-bg-secondary">${child.writeDate}</span>&nbsp;
																	<!--------------------------------- ๋๊ธ์ด ๋ฌ๋ฆฐ ์๊ฐ badge fin. -->
																	<c:if test="${child.isEdited} eq '1'}">
																		<!-- ์์ ๋ ๋๊ธ์ ๊ฒฝ์ฐ badge -->
																		<span class="badge rounded-pill text-bg-secondary">์์ ๋จ</span>&nbsp;
																		<!--------------------------------- ์์ ๋ ๋๊ธ์ ๊ฒฝ์ฐ badge fin. -->
																	</c:if>
																	<c:if test="${child.userId eq boardArticle.userId}">
																		<!-- ํด๋น ๊ธ์ ์์ฑ์์ธ ๊ฒฝ์ฐ badge -->
																		<span class="badge rounded-pill text-bg-warning">์์ฑ์</span>
																		<!--------------------------------- ํด๋น ๊ธ์ ์์ฑ์์ธ ๊ฒฝ์ฐ badge fin. -->
																	</c:if>
																</p>
															</div>
															<div class="replyarea">
																<div class="col-12 lh-base">
																	<textarea class="innerReply" id="innerReply${counter }"
																		maxlength="501" name="content"
																		onkeyup="countComment(this.value, ${counter })"
																		readonly>${child.content}</textarea>
																</div>
															</div>
															<div class="col-12">
																<div class="addreplybtn">
																	<button type="button" class="btn btn-outline-secondary"
																		id="addReplyBtn" onclick="show_reply(${counter })">๋ต๊ธ
																	</button>
																	<c:if test="${child.userId eq userId}">

																		<!---------------------------------- ์ ์ํ ์ ์ ๊ฐ ์์ฑํ ๋๊ธ์ผ ๊ฒฝ์ฐ ์์  ๊ฐ๋ฅ -->
																		<button type="button"
																			class="btn btn-outline-secondary" id="editBtn"
																			onclick="showedit(${counter })">์์ </button>
																	</c:if>
																</div>
																<%-- 														<c:if test="${child.id eq userId}"> --%>
																<div class="replyBtn">
																	<span class="badge rounded-pill text-bg-secondary"
																		id="countBadge1"><span class="counter"></span>/ 500 </span>
																	<button type="submit" class="btn btn-outline-success"  id="editConfirmComment">๋๊ธ ์์ </button>
																	<a href="${pageContext.request.contextPath}/delete_comment/${boardNum}/${child.commentNum }"
																	class="btn btn-outline-danger" id="deleteComment">
																		๋๊ธ ์ญ์ 
																	</a>
																	<button type="button" class="btn btn-outline-secondary" id="editCancel" onclick="cancelEdit()">์ทจ์</button>
																</div>
																<%-- 														</c:if> --%>
																<!---------------------------------------------------- ์ ์ํ ์ ์ ๊ฐ ์์ฑํ ๋๊ธ์ผ ๊ฒฝ์ฐ ์์  ๊ฐ๋ฅ fin.-->
															</div>
														</form>


														<!-- *********************************************************************************************** -->
														<!----------------------------------------------------------------------------- ๋ต๊ธ ์์ฑ ํผ  -->
														<!--  id="replyTextarea0", count_reply(replyTextarea0.value, 0) -->

														<form name="" method="post"
															action="/baguel/add_child_comment.do">
															<input type="hidden" name="parentComment"
																value="${parent.commentNum}">
															<div class="addReply">
																<div class="col-12">
																	<div class="form-floating" id="leaveComment">
																		<textarea class="form-control" placeholder="activate"
																			id="replyTextarea${counter }" maxlength="501"
																			name="content"
																			onkeyup="count_reply(this.value, ${counter })"></textarea>
																		<label for="replyTextarea${counter }">${userNick }</label>
																	</div>
																</div>
																<div class="col-12" id="bottomMenu">
																	<span class="badge rounded-pill text-bg-secondary"
																		id="countBadge1"><span class="counterreply"></span>
																		/ 500</span>&nbsp;
																	<button type="submit" class="btn btn-outline-success"
																		id="confirmReply">๋ฑ๋ก</button>
																	<button type="button" class="btn btn-outline-secondary"
																		id="editCancel" onclick="cancelEdit()">์ทจ์</button>
																</div>
															</div>
															<div class="col-12">
																<hr>
															</div>
														</form>
													</div>
												</div>
												<!-- row -->
											</c:otherwise>
										</c:choose>
									</c:if>
								</c:forEach>
								<!--********************************************************************************** ๋๋๊ธ fin -->
								<!-- *********************************************************************************************** -->
							</c:otherwise>
						</c:choose>
					</c:forEach>


					<!-- *********************************************************************************************** -->
					<!------------------------------------------- ์ตํ๋จ ๋๊ธ -->
					<div class="row">
						<div class="col-12">
							<span class="badge text-bg-primary">์๋ก์ด ๋๊ธ์ ๋จ๊ฒจ ๋ณด์ธ์</span>
						</div>
						<form name="" method="post" action="/baguel/add_comment.do">
							<input type="hidden" name="boardNum" value="${boardNum }">
							<div class="col-12">
								<div class="form-floating" id="leaveComment">
									<textarea class="form-control" placeholder="activate"
										id="bottomTextarea" maxlength="501" name="content"
										onkeyup="counterLast(this.value)"></textarea>
									<label for="bottomTextarea">${userNick }</label>
								</div>
							</div>
							<div class="col-12">
								<div id="commentMenu">
									<span class="badge rounded-pill text-bg-secondary"
										id="countBadge"><span id="counterBottom"></span> / 500
									</span>&nbsp;
									<button type="submit" class="btn btn-outline-success"
										id="confirmReply">๋ฑ๋ก</button>
								</div>
							</div>
							<div class="col-12">
								<hr id="commentHr">
							</div>
						</form>
					</div>
					<!------------------------------------------------------------------------------ ์ตํ๋จ ๋๊ธ -->
					<!-- *********************************************************************************************** -->

					<div class="row">
						<div class="col-12">
							<form>
								<input type="button" value="๋ฆฌ์คํธ๋ก ๋์๊ฐ๊ธฐ" id="goBack"
									onclick="window.history.back()">
							</form>
						</div>
					</div>
					</form>
				</div>
				<!-- #comments -->
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
	<script src="${pageContext.request.contextPath}/js/cal_list_view.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>

</html>