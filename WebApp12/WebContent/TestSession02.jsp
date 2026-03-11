<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//TestSession02.jsp
	//-- 세션의 속성을 제거하여 로그아웃 액션 처리
	// 방법 ⓐ 
	//session.removeAttribute("userId");
	//session.removeAttribute("userName");
	//-- 세션의 사용자 아이디, 사용자 이름 삭제
	
	// 방법 ⓑ
	// 기존 세션에 저장되어 있는 모든 속성을 제거하고
	// 세션을 초기화
	session.invalidate();
	
	// 클라이언트에 다시 TestSession01.jsp(로그인 페이지)를 요청할 수 있도록 안내
	response.sendRedirect("TestSession01.jsp");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSession02.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css" />
</head>
<body>

</body>
</html>