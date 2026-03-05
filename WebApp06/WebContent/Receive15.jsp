<%@ page contentType="text/html; charset=UTF-8"%>
<%
	
	//이전 페이지(Foreward15.jsp)로부터 넘어온 데이터 수신	
	//-- resultStr

/* 	String num1 = request.getParameter("num1");
	String num2 = request.getParameter("num2");
	String op = request.getParameter("op"); */
	String result = (String)request.getAttribute("resultStr");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive15.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css" />
</head>
<body>
	<h2>연산 결과 확인</h2>
	<%-- <h3>정수1: <%= num1 %>, 정수2: <%=num2 %>, 연산자: <%= op %></h3> --%>
	<h3><%= result %></h3>
</body>
</html>