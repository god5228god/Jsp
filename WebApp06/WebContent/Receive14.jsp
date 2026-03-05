<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지(Send14Redirect.jsp)로부터 넘어온 데이터 수신
	// 이전 페이지(Send14Forward.jsp)로부터 넘어온 데이터 수신
	// → userName + message
	
	request.setCharacterEncoding("UTF-8");

	String userName = request.getParameter("userName");
	
	//String message = request.getParameter("message");
	
	// check!
	// - setAttribute()로 넘긴 값을 수신하는 과정은 getAttribute()로 처리해야 한다.
	// - getAttribute() 메소드는 Object를 반환한다.
	//String message = request.getAttribute("message");
	String message = (String)request.getAttribute("message");		//-- 다운캐스팅
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive14.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css" />
</head>
<body>
<div>
	<h1>데이터 송수신 실습 14</h1>
	<p>최종 결과 수신(Receive14.jsp)</p>
	<hr />
</div>
<div>
	<h2>결과확인</h2>
	<h3>이름: <%=userName %></h3>
	<h3>내용: <%=message %></h3>
</div>
</body>
</html>