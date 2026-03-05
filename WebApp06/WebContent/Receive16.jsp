<%@ page contentType="text/html; charset=UTF-8"%>
<%
	
	// 이전 페이지(Redirect16.jsp)로부터 넘어온 데이서 수신
	
	//http://localhost:3306/WebApp06/Receive16.jsp?num1=12&num2=12&op=2&str=0
	//-- 직접 Redirect16.jsp로부터 데이터를 넘겨받는 것이 아니라
	//   클라이언트가 새로운 요청을 하도록 만들어
	//   이 과정에서 넘긴 값을 새롭게 수신하는 개념
	
	String num1 = request.getParameter("num1");
	String num2 = request.getParameter("num2");
	String op = request.getParameter("op");
	String str = request.getParameter("str");

	if(op.equals("1")){
		op="+";
	}else if(op.equals("2")){
		op="-";
	}else if(op.equals("3")){
		op="*";
	}else if(op.equals("4")){
		op="/";
	}
	
	String strResult = String.format("%s %s %s = %s",num1, op, num2, str);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/main.css" />
</head>
<body>
<h3>연산 결과: <%= strResult %></h3>
</body>
</html>