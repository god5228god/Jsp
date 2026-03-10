<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지로부터(TestSession01.jsp)넘어온 데이터 수신
	//-- userId, userPwd
	
	String userId = request.getParameter("userId");
	String userPwd = request.getParameter("userPwd");
	
	// DB 활용 → dao 로그인 처리 → dto 활용 
	// → 로그인에 관여하는 테이블의 데이터와 비교 → 최종적으로 로그인 액션 처리
	
	
	String memberId = "superman";
	String memberPwd = "java004";
	String memberName = "양호열";
	
	if(userId.equals(memberId) && userPwd.equals(memberPwd))
	{
		// 로그인 액션 처리
		session.setAttribute("userId", userId);			// session의 userId → superman
		session.setAttribute("userName", memberName);	// session의 userName → 양호열
		
		// 클라이언트가 TestSession01.jsp 페이지를 다시 요청할 수 있도록 안내
		response.sendRedirect("TestSession01.jsp");
	}
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/main.css" />
</head>
<body>
<div>
	<h1>로그인 실패</h1>
	<hr />
</div>
<a href="TestSession01.jsp">로그인 페이지로 돌아가기</a>
</body>
</html>