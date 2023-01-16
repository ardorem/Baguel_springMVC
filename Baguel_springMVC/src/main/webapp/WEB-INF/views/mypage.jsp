<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="css/header_footer.css">
  <link rel="stylesheet" href="css/mypage.css">
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
	</div>  
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
            <li><a href="/baguel/list.do?page=1">등록된 일정</a></li>
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
        <h1>마이 페이지</h1>
      </div>
      
      <div id="addOk">
        <span class="welcome">안녕하세요, ${userNick }님</span>
      </div>
      
      <div id="mypage">
        <div id="myRequest">
          <h1>내가 작성한 글</h1>
          <table>
            <tr>
              <th>No.</th>
              <th>작성일</th>
              </th>
              <th>글 제목</th>
              <th>닉네임</th>
              <th>처리여부</th>
            </tr>
            <tr>
              <td>50</td>
              <td>2022-10-22</td>
              <td><a href="cal_add_user.jsp">[ 고척스카이돔 ] 임영웅 콘서트 [IM HERO](user)</a></td>
              <td>Lucian</td>
              <td>처리중</td>
            </tr>
            <tr>
              <td>42</td>
              <td>2022-10-22</td>
              <td>[ 이화여자대학교 삼성홀 ] Heize 1st Concert Heize City in Seoul</td>
              <td>Lucian</td>
              <td class="complete">추가완료</td>
            </tr>
          </table>
        </div>
        <div id="myCommet">
          <h1>내가 작성한 댓글</h1>
          <table>
            <tr>
              <th>No.</th>
              <th>작성일</th>
              </th>
              <th>글 제목</th>
              <th>닉네임</th>
              <th>처리여부</th>
            </tr>
            <tr>
              <td>48</td>
              <td>2022-10-22</td>
              <td>[ 국립현대 미술관 ] 프로젝트 해시태그 2022<br>
                <span class="comment">➥ 흥미로운 전시네요!</span></td>
              <td>Maris</td>
              <td>처리중</td>
            </tr>
            <tr>
              <td>46</td>
              <td>2022-10-22</td>
              <td>[ coex 신한카드 artium ] THE WONDERFUL HYNNIVERSARY 〈LET ME IN〉<br>
                <span class="comment">➥ 일정 종료일이 잘못 된것 같아요 ....</span></td>
              <td>Georgina</td>
              <td>처리중</td>
            </tr>
          </table>
        </div>
        <hr>
        <form>
          <input type="button" value="회원정보 수정" onClick="location.href='modify_pw_check'"> 
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