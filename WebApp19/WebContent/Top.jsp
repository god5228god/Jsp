<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Top.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css" />
</head>
<body>
<div>
	<!-- 상단메뉴<br> -->
	<h1><%=request.getParameter("title") %></h1>
	<a href="">로그인</a>|<a href="">회원가입</a>|<a href="">정보확인</a>|<a href="">환경설정</a>
</div>
</body>
</html>