<%@ page contentType="text/html; charset=UTF-8"%>
<%
/* 	String danStr = request.getParameter("dan");
	
	int dan = Integer.parseInt(danStr);
	String result = "";
	for(int i = 1;  i<=9; i++){
		result += String.format("%d * %d = %d<br>", dan, i, (dan*i));
	} */
	
	// 모범 답안
	// 이전페이지(Send13.jsp)로부터 넘어온 데이터 수신
	//-- gugudan
	String gugudanStr = request.getParameter("gugudan");
	
	int gugudan = 0;
	String result = "";
	
	try{
		gugudan = Integer.parseInt(gugudanStr);
		for(int i = 1;  i<=9; i++){
			result += String.format("%d * %d = %d<br>", gugudan, i, (gugudan*i));
		} 
		
	}catch(Exception e){
		System.out.println(e.toString());
	}
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive13.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css" />
</head>
<body>
<div>
<div>
	<h1>JSP를 이용한 데이터 송수신 실습 13</h1>
	<p>Send13.jsp○ → Receive13.jsp●</p>
	<hr />
</div>
<div>
	<h2>수신된 데이터: <%=gugudan %></h2>	
	<%= result %>
</div>
</div>
</body>
</html>