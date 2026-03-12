<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="guest"	class="com.test.GuestBean"></jsp:useBean>
<jsp:setProperty property="*" name="guest"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/main.css" />
</head>
<body>
<div>
	<h2>결과 출력</h2>
	<h3><%= guest.result() %></h3>
</div>
</body>
</html>