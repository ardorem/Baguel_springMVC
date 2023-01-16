<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<form action="register" method="post">
	아이디 : <input type="text" name="userId"><br>
	닉네임 : <input type="text" name="nickName"><br>
	<input type="submit" value="회원가입">
</form>
</body>
</html>
