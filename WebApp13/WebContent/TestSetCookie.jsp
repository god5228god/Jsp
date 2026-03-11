<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	// 쿠키 생성 (서버에 생성된 쿠키)
	// 문자열 기반 
	//Cookie c = new Cookie(쿠키이름, 쿠키값);
	Cookie c = new Cookie("cookie_test", "studyCookie");
	
	// 쿠키 설정 (서버에 생성된 쿠키에 대해 설정)
	// 쿠키 유효시간 설정
	//c.setMaxAge(5);
	//-- 쿠키 5초간 유지
	//c.setMaxAge(60*60*1);
	c.setMaxAge(3600);
	//-- 쿠키 1시간 유지
	
	// 쿠키 설정 (서버에 생성된 쿠키에 대해 설정)
	c.setPath(request.getContextPath());		//-- 『"/"』
	//-- 이 쿠키를 프로젝트 전체 경로에서 인식할 수 있도록 처리하는 설정 

	
	// 쿠키 추가 (서버에서 생성된 쿠키를 클라이언트에 전송 → 클라이언트의 쿠키 상자에 추가)
	response.addCookie(c);
	
	response.sendRedirect("LoginForm.jsp");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSetCookie.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css" />
</head>
<body>
<div>
	<h1>쿠키 설정 및 추가</h1>
	<p>TestSetCookie.jsp</p>
	<hr />
</div>
<div>
	<a href="TestGetCookie.jsp">
		<button type="button" class="btn">쿠키 정보 확인</button>
	</a>
		<a href="TestRemoveCookie.jsp">
		<button type="button" class="btn">쿠키 정보 삭제</button>
	</a>
</div>
</body>
</html>