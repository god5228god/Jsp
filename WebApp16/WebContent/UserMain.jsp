<%@page import="com.sun.org.apache.xpath.internal.operations.Bool"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	

	Boolean isMain = (Boolean)application.getAttribute("isMaintenance");
	String msg = (String)application.getAttribute("noticeMsg");
	
	String mode = "";
	if(isMain)
		mode = "점검 중";
	else
		mode = "정상 가동";
	
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UserMain.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css" />
<style type="text/css">
	h3{display: block; width: 100%; height: 35px; border-radius: 5px; padding: 5px; box-sizing: border-box; }
	.on {background-color: #ff7675; color: #fff; } 		/* 점검 중 색상 */
	.off {background-color: #55efc4; color: #2d3436;} 	/* 정상 운영 색상 */
	.nav-link
	{
		display: block;
		text-align: center;
		margin-top: 20px;
		color: #7f8c8d;
		text-decoration: none;
	}
</style>
</head>
<body>

<div>
	<h2>모드: <%=mode %></h2>
	<h3 class="<%=isMain? "on":"off" %>">안내: <%=msg %></h3>
	<a href="AdminSetting.jsp" class="nav-link">관리자 페이지로 이동하여 설정하기 ▶</a>
</div> 

<!-- 강사님 풀이  -->
<%-- <%
	if(isMain!=null && isMain)
	{
%>
	<h2>점검중</h2>
	<div style="background: #ff7675; padding: 10px; border: 2px solid red;">
		<span style="font-weight: bold; color: white;">안내 : <%= msg %></span>
	</div>
<%
}
else
{
%>
	<h2>정상 운영중</h2>
	<div style="background: #55efc4; padding: 10px; border: 2px solid red;">
		<span style="font-weight: bold; color: #2d3436;">안내 : <%= msg %></span>
	</div>
<%
}%> --%>
</body>
</html>