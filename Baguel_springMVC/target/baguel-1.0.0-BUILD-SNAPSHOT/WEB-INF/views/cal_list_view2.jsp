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
<title>바글</title>
</head>
<body>
	<div id="container">
		<!-- ****************************************************************************** header & nav start-->
		<header>
			<a href="${pageContext.request.contextPath}/main">
				<div id="logo">
					<p>바글🚶‍♂️🚶🚶‍♀️</p>
				</div>
			</a>
			<div id="loginMenu">
				<c:choose>
					<c:when test="${userId eq null }">
						<a href="register">회원가입</a>
						<a href="login">로그인</a>
					</c:when>
					<c:otherwise>
				${userId }&nbsp;&nbsp;
				<a href="mypage">마이페이지</a>
						<a href="/baguel/logout.do">로그아웃</a>
					</c:otherwise>
				</c:choose>
			</div>
		</header>
		<nav>
			<ul id="navi">
				<li><a href="#">조회</a>
					<ul>
						<li><a href="srch_station.html">역으로 조회</a></li>
						<li><a href="srch_place.html">장소로 조회</a></li>
					</ul></li>
				<li><a href="cal_view.html">캘린더</a>
					<ul>
						<li><a href="${pageContext.request.contextPath}/cal_add">일정 등록</a></li>
						<li><a href="/baguel/list.do?page=1">등록된 일정</a></li>
						<li><a href="cal_view.html">캘린더 보기</a></li>
					</ul></li>
				<li><a href="map">지도로 보기</a></li>
				<li><a href="#">이용 안내</a>
					<ul>
						<li><a href="about.html">about 바글</a></li>
					</ul></li>
			</ul>
		</nav>
		<!-- ************************************************************************* header & nav end -->

		<!-- ******************************************************************************main start -->
		<main>
			<!-- !!! 여기부터 작성 !!! -->
			<div id="mainTitleUser">
				<h1>게시글 보기</h1>
			</div>
			<div id="regEvent" class="container">
				<!----------------------------------------------------------------------------------------------- 이벤트 이름 -->
				<div class="row" id="eventTitle">
					<div class="col-md-12">
						<span class="badge text-bg-dark">이벤트 이름</span>
						<h2>
							[${boardArticle.eventPlace}]<br>${boardArticle.event}</h2>
					</div>
				</div>

				<!----------------------------------------------------------------------------------------------- 이벤트 정보 -->
				<div class="row" id="eventInfo">

					<div class="col-md-4" id="infoBadge">
						<span class="badge text-bg-light">${boardArticle.eventType}</span>
					</div>

					<div class="col-md-4" id="infoBadge">
						<span class="badge text-bg-light">${boardArticle.eventFrom}시작</span>
					</div>

					<div class="col-md-4" id="infoBadge">
						<span class="badge text-bg-light">${boardArticle.eventTo}종료</span>
					</div>

				</div>
				<!----------------------------------------------------------------------------------------------- 작성자, 조회수 -->
				<div class="row">

					<div class="col-md-6">
						<p class="fs-4">
							작성자 <span class="writer">${boardArticle.userNick}&nbsp;</span>
							<c:if test="${boardArticle.userId == userId}" var="result">
								<span class="badge text-bg-warning">내가 작성한 요청</span>
							</c:if>
						</p>
						<p class="fs-6">
							작성일 ${boardArticle.writeDate}<br>
							<c:if test="${boardArticle.editDate != null}" var="result">
								<span class="text-secondary"> 수정일 ${boardArticle.editDate} </span>
							</c:if>
						</p>
					</div>

					<div class="col-md-6" id="viewCount">조회수 :
						${boardArticle.viewcount}</div>

					<div class="col-md-12">
						<hr>
					</div>
				</div>
				<!----------------------------------------------------------------------------------------------- 추가 코멘트 -->
				<div class="row">
					<div class="col-md-12" id="eventDesc">
						<span class="badge text-bg-dark">추가 코멘트</span>
						<c:if test="${boardArticle.eventDesc eq null}" var="result">
							<h3>작성자의 추가 코멘트가 없습니다.</h3>
						</c:if>
						<c:if test="${boardArticle.eventDesc ne null}" var="result">
							<p class="fs-4">&nbsp;${boardArticle.eventDesc}</p>
						</c:if>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12" id="eventDesc">
						<span class="badge text-bg-dark">관리자 메시지</span>
						<c:if test="${boardArticle.adminMSG == null}" var="result">
							<h3>관리자의 메시지가 없습니다.</h3>
						</c:if>
						<c:if test="${boardArticle.adminMSG != null}" var="result">
							<p class="fs-4">&nbsp;${boardArticle.adminMSG}</p>
						</c:if>
					</div>
				</div>
				<div class="row">
					<div class="col-md-8">
						<!-- 글 작성자가 접속한 경우 수정 버튼 -->
						<c:if test="${boardArticle.userId == userId}" var="result">
							<!-- ****************************Button trigger modal -->
							<button type="button" id="buttons" class="btn btn-primary"
								data-bs-toggle="modal" data-bs-target="#modalEfect">글
								수정하기</button>

							<!-- Modal -->
							<div class="modal fade" id="modalEfect" tabindex="-1"
								aria-labelledby="modalEfectLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h1 class="modal-title fs-5" id="modalEfectLabel">수정 확인</h1>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">정말 수정하시겠어요?</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-bs-dismiss="modal">취소</button>
											<form action="${pageContext.request.contextPath}/edit_article" method="get">
												<input type="hidden" name="boardNum" value="${boardNum }">
												<button type="submit" class="btn" id="edit_btn">글
													수정하기</button>
											</form>
										</div>
									</div>
								</div>
							</div>
							<!-- *****************************************************Button trigger modal -->
						</c:if>
					</div>

					<div class="col-md-4">
						<!-- <span class="badge text-bg-secondary" id="approval">처리전</span> -->
						<c:if test="${boardArticle.approval == 1}" var="result">
							<span class="badge text-bg-dark" id="approval">처리완료</span>
						</c:if>
						<c:if test="${boardArticle.approval == 0}" var="result">
							<span class="badge text-bg-light" id="approval">처리중</span>
						</c:if>
					</div>
				</div>

				<div class="row">
					<div class="col-12">
						<hr>
					</div>
				</div>

				<!-- **************************************************************************************************************************** -->
				<!-- ********************************************** 댓글 시작 ******************************************************************* -->
				<!-- **************************************************************************************************************************** -->
				<div id="comments">
					<!-- 댓글 전체를 감싸는 div -->

					<!--****************************************************************************************** comment -->
					<!-- ************************************************************************************************* -->
					<c:if test="${parentComments.size() eq 0 }">
						<div class="row">
							<div class="col-12">댓글</div>
							<div class="col-12">
								<h3>아직 등록된 댓글이 없습니다.</h3>
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
										<h5>삭제된 댓글입니다.</h5>
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
								<!--******************************************** 댓글 시작 -->
								<div id="comment">
									<div class="row">
										<!-- 댓글 수정 form -->
										<form method="post" action="${pageContext.request.contextPath}/edit_comment">
											<input type="hidden" name="commentNum" value="${parent.commentNum }">
											<input type="hidden" name="boardNum" value="${boardNum}">
											<div class="col-12">
												<p class="fs-5 fw-bold">
													${parent.userId}&nbsp;
													<!-- 댓글이 달린 시간 badge -->
													<span class="badge rounded-pill text-bg-secondary">${parent.writeDate}</span>&nbsp;
													<!--------------------------------- 댓글이 달린 시간 badge fin. -->
													<c:if test="${parent.isEdited eq '1'}">
														<!-- 수정된 댓글의 경우 badge -->
														<span class="badge rounded-pill text-bg-secondary">수정됨</span>&nbsp;
													<!--------------------------------- 수정된 댓글의 경우 badge fin. -->
													</c:if>
													<c:if test="${parent.userId eq boardArticle.userId}">
														<!-- 해당 글의 작성자인 경우 badge -->
														<span class="badge rounded-pill text-bg-warning">작성자</span>
														<!--------------------------------- 해당 글의 작성자인 경우 badge fin. -->
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
														id="addReplyBtn" onclick="show_reply(${counter })">답글
													</button>
													<c:if test="${parent.userId eq userId}">

														<!---------------------------------- 접속한 유저가 작성한 댓글일 경우 수정 가능 -->
														<button type="button" class="btn btn-outline-secondary"
															id="editBtn" onclick="showedit(${counter })">수정</button>
													</c:if>
												</div>
												<%-- 												<c:if test="${parent.id eq userId}"> --%>
												<div class="replyBtn">
													<span class="badge rounded-pill text-bg-secondary"
														id="countBadge1"><span class="counter"></span> /
														500 </span>
													<button type="submit" class="btn btn-outline-success"
														id="editConfirmComment">댓글 수정</button>
													<a href="${pageContext.request.contextPath}/delete_comment/${boardNum}/${parent.commentNum }"
														class="btn btn-outline-danger" id="deleteComment">
														댓글 삭제
													</a>
													<button type="button" class="btn btn-outline-secondary"
														id="editCancel" onclick="cancelEdit()">취소</button>
												</div>
												<%-- 												</c:if> --%>
												<!---------------------------------------------------- 접속한 유저가 작성한 댓글일 경우 수정 가능 fin.-->
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
															id="confirmReply">등록</button>
														<button type="button" class="btn btn-outline-secondary"
															id="editCancel" onclick="cancelEdit()">취소</button>
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
								<!--******************************************** 댓글 끝 -->
								<!-- *********************************************************************************************** -->
								<!-- /////////////////////////////////////////////////////////////////////////////////////////////// -->
								<!-- *********************************************************************************************** -->
								<!--********************************************************************************** 대댓글 start -->
								<c:forEach items="${childComments }" var="child">
									<c:if test="${child.parentComment eq parent.commentNum }">
										<c:choose>
											<c:when test="${child.status eq 0}">
												<div class="row" id="reply">
													<div class="col-12" id="deleted">
														<h5>삭제된 댓글입니다.</h5>
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
																	<!-- 댓글이 달린 시간 badge -->
																	<span class="badge rounded-pill text-bg-secondary">${child.writeDate}</span>&nbsp;
																	<!--------------------------------- 댓글이 달린 시간 badge fin. -->
																	<c:if test="${child.isEdited} eq '1'}">
																		<!-- 수정된 댓글의 경우 badge -->
																		<span class="badge rounded-pill text-bg-secondary">수정됨</span>&nbsp;
																		<!--------------------------------- 수정된 댓글의 경우 badge fin. -->
																	</c:if>
																	<c:if test="${child.userId eq boardArticle.userId}">
																		<!-- 해당 글의 작성자인 경우 badge -->
																		<span class="badge rounded-pill text-bg-warning">작성자</span>
																		<!--------------------------------- 해당 글의 작성자인 경우 badge fin. -->
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
																		id="addReplyBtn" onclick="show_reply(${counter })">답글
																	</button>
																	<c:if test="${child.userId eq userId}">

																		<!---------------------------------- 접속한 유저가 작성한 댓글일 경우 수정 가능 -->
																		<button type="button"
																			class="btn btn-outline-secondary" id="editBtn"
																			onclick="showedit(${counter })">수정</button>
																	</c:if>
																</div>
																<%-- 														<c:if test="${child.id eq userId}"> --%>
																<div class="replyBtn">
																	<span class="badge rounded-pill text-bg-secondary"
																		id="countBadge1"><span class="counter"></span>/ 500 </span>
																	<button type="submit" class="btn btn-outline-success"  id="editConfirmComment">댓글 수정</button>
																	<a href="${pageContext.request.contextPath}/delete_comment/${boardNum}/${child.commentNum }"
																	class="btn btn-outline-danger" id="deleteComment">
																		댓글 삭제
																	</a>
																	<button type="button" class="btn btn-outline-secondary" id="editCancel" onclick="cancelEdit()">취소</button>
																</div>
																<%-- 														</c:if> --%>
																<!---------------------------------------------------- 접속한 유저가 작성한 댓글일 경우 수정 가능 fin.-->
															</div>
														</form>


														<!-- *********************************************************************************************** -->
														<!----------------------------------------------------------------------------- 답글 완성 폼  -->
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
																		id="confirmReply">등록</button>
																	<button type="button" class="btn btn-outline-secondary"
																		id="editCancel" onclick="cancelEdit()">취소</button>
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
								<!--********************************************************************************** 대댓글 fin -->
								<!-- *********************************************************************************************** -->
							</c:otherwise>
						</c:choose>
					</c:forEach>


					<!-- *********************************************************************************************** -->
					<!------------------------------------------- 최하단 댓글 -->
					<div class="row">
						<div class="col-12">
							<span class="badge text-bg-primary">새로운 댓글을 남겨 보세요</span>
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
										id="confirmReply">등록</button>
								</div>
							</div>
							<div class="col-12">
								<hr id="commentHr">
							</div>
						</form>
					</div>
					<!------------------------------------------------------------------------------ 최하단 댓글 -->
					<!-- *********************************************************************************************** -->

					<div class="row">
						<div class="col-12">
							<form>
								<input type="button" value="리스트로 돌아가기" id="goBack"
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
	<script src="${pageContext.request.contextPath}/js/cal_list_view.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>

</html>