<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	Boolean mode = (Boolean)application.getAttribute("isMaintenance");
	String msg = (String)application.getAttribute("msg");
	
	String status = "";
	if(mode)
		status = "점검 중";
	else	
		status = "정상 가동 중";
		
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UserMain_1.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css" />
</head>
<body>
<h3>상태: <%=status %></h3>
<p>안내: <%=msg %></p>
<a href="AdminSetting_1.jsp">돌아가기</a>

</body>
</html>