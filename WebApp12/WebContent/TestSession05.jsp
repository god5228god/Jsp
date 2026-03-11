<%@page import="oracle.net.aso.r"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%

	// 이전페이지(TestSession04.jsp)로부터 넘어온 데이터 수신
	//-- id, pwd
	//  + userName, userTel
	
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	String name = (String)session.getAttribute("userName");
	String tel = (String)session.getAttribute("userTel");
	
	// Check!
	// 더 이상 세션에 담아둘 데이터를 쓸 필요가 없다면
	// 세션에서 제거하기 (새고해서도 필요하다면 스크립트단에서 변수로 담아놓고 쓰면 된다)
	// 메모리 리소스
	session.removeAttribute("userName");
	session.removeAttribute("userTel");
	
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
	<h1>TestSession05.jsp</h1>
 	<p>이름, 전화번호, 아이디, 패스워드 확인</p>
 	<hr />
</div>
<div>
	<h2>이름: <%= name %></h2>
	<h2>전화번호: <%= tel %></h2>
	<h2>아이디: <%= id %></h2>
	<h2>비밀번호: <%=  pwd %></h2>
</div>
</body>
</html>