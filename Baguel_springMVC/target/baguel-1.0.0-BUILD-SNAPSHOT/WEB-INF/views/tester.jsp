<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<title>TESTER</title>
</head>
<body>
	<h1>기온 : ${places[0].avgTemp }도</h1>
	<h1>강수량 : ${places[0].precipitation }ml</h1>
	<h1>예측일 : ${today }</h1>

	<c:if test="${places ne null }">
		<table class="table table-hover">
			<tr>
				<th>placeName</th>
				<th>lat</th>
				<th>lng</th>
				<th>visitors</th>
				<th>xy</th>
				<th>place</th>
				<th>day</th>
				<th>selectDate</th>
				<th>fcstDate</th>
			</tr>
			<c:forEach items="${places }" var="place">
				<tr>
					<td>${place.placeName }</td>
					<td>${place.lat }</td>
					<td>${place.lng }</td>
					<td>${place.visitors }</td>
					<td>${place.xy }</td>
					<td>${place.place }</td>
					<td>${day}</td>
					<td>${selectDate }</td>
					<td>${fcstDate }</td>
					<td><a
						href="${pageContext.request.contextPath}/result_place?day=${day }&selectDate=${selectDate }&xy=${place.xy }&fcstDate=${fcstDate }&place=${place.place }">링크로
							조회하기</a></td>
				</tr>
			</c:forEach>
			<c:if test="${line1 eq null }">
				line1 NULL
			</c:if>
			<c:if test="${line1 ne null }">
				line1 NOT NULL
			</c:if>
			<c:forEach items="${line1 }" var="line">
				<tr>
					<td>${selectDateStation }</td>
					<td>${line.lat }</td>
					<td>${line.lng }</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>