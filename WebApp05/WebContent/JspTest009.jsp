<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립릿 영역 구성
	// →JSP 코드 작성(자바 코드 작성)
	StringBuffer sb = new StringBuffer();

	sb.append("<ul>");	
	for(int i = 1; i <=10; i++)	
	{
		sb.append("<li>" + i + "</li>");
	}
	sb.append("</ul>");	
%>
<%
	String num = "";
	for(int i = 1; i<=10; i++){
		num += i+" "; 
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JspTest009.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css" />
<style type="text/css">
	li{list-style: none;}
</style>
</head>
<body>
<div>
	<h1>JSP 기초</h1>
	<hr />
</div>
<!--
	○ 스크립릿/ 표현식 실습
	- 1부터 10까지의 정수를 출력하는 JSP 페이지를 작성한다.
	- 요청 주소는
		http://localhost:3306/WebApp05/JspTest009.jsp로 한다.
	- 반복문을 활용한다.
  -->
  <div><%= sb.toString() %></div>
  <br><br>
  <div><%= num %></div>
</body>
</html>