<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="ob" class="com.model.UserBean" scope="session"></jsp:useBean>
<jsp:setProperty property="*" name="ob"/>
<jsp:forward page="RegisterResult.jsp"></jsp:forward>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RegisterProcess.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css" />
</head>
<body>

</body>
</html>