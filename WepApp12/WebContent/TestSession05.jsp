<%@page import="oracle.net.aso.r"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	String name = (String)session.getAttribute("userName");
	String tel = (String)session.getAttribute("userTel");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSession05.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css" />
</head>
<body>
<div>
	<h2>아이디: <%= id %></h2>
	<h2>비밀번호: <%=  pwd %></h2>
	<h2>이름: <%= name %></h2>
	<h2>전화번호: <%= tel %></h2>
</div>
</body>
</html>