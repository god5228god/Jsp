<%@page import="com.test.Calculator"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<!-- Calculator_ok2.jsp -->
<%-- <jsp:useBean id="ob" class="com.test.Calculator"></jsp:useBean>

<jsp:setProperty property="su1" name="ob"/>
<jsp:setProperty property="su2" name="ob"/>
<jsp:setProperty property="op" name="ob"/> --%>

<jsp:useBean id="ob" class="com.test.Calculator"></jsp:useBean>
<jsp:setProperty property="*" name="ob"/>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calculator_ok3.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css" />
</head>
<body>
	<div>
		<h1>세 번째 방법 처리 결과</h1>
		<p>Calculator_ok3.jsp</p>
		<hr />
	</div>
	<div>
		<h2>결과 출력</h2>
		<h2><%=ob.result() %></h2>
	</div>
</body>
</html>




