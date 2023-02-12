<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
  <link rel="stylesheet" href="${contextPath}/css/error.css">
  <title>바글</title>
<link rel="icon" href="${contextPath}/images/favicon.png">
</head>

<body>
  <div class="container">
    <div class="row">
      <div class="col-12" id="logo">
        <img src="${contextPath}/images/logo.png"></img>
      </div>
      <c:set var="path" value="${requestScope['javax.servlet.forward.servlet_path']}" /> 
      <div class="col-12">
        <div class="alert alert-dark" role="alert">
          <p class="text-break">에러가 발생했습니다.<br>
            요청하신 URL <span class="fw-semibold">${path }${pageContext.request.queryString} </span> 을(를) 찾을 수 없습니다.</p>
          <hr>
          <p>입력하신 주소가 정확한지 다시 한번 확인해주세요.</p>
        </div>
      </div>
      <div class="col-6"></div>
      <div class="col-6">
        <a type="button" class="btn btn-outline-success" href="${pageContext.request.contextPath}/main" id="goBackBtn">메인으로 돌아가기</a>
      </div>
    </div>
  </div>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
    crossorigin="anonymous"></script>
</body>

</html>