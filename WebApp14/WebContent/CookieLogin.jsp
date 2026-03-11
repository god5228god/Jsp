<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String userId = request.getParameter("userId");
	String userPwd = request.getParameter("userPwd");
	String check = request.getParameter("check"); // on null
	
	Cookie id = new Cookie("userId", userId);

	StringBuffer str = new StringBuffer();
	
	if(check!=null && check.equals("on")){
		id.setMaxAge(3600*24*7);
		str.append("<h2>");
		str.append("아이디가 기억되었습니다.");
		str.append("</h2>");
	}else{
		id.setMaxAge(0);
		str.append("<h2>");
		str.append("아이디를 기억하지 않습니다.");
		str.append("</h2>");
	}

	response.addCookie(id);
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CookieLogin.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css" />
<style type="text/css">
.btn{width: 300px; height: 40px; font-size: 18px; 
			font-weight: bold; border: none; background-color: #000; color: #fff;
			cursor: pointer;}
.btn:hover{background-color: #eee; color: #000;}
</style>
</head>
<body>
<%= str %>
<a href="LoginForm.jsp">
	<button type="button" class="btn">로그인페이지로 돌아가기</button>
</a>
</body>
</html>