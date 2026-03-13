<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!-- 기본 scope는 page 생략하면 page임 -->
<jsp:useBean id="guest"	class="com.test.GuestBean" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="guest"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Guest_ok.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css" />
</head>
<body>
<div>
	<h2>작성된 내용 확인</h2>
	<div>
		<h3>작성자: <%=guest.getWriter() %></h3>
		<h3>제목: <%=guest.getTitle() %></h3>
		<!-- Check! -->
		<h3>내용: <%=guest.getContents().replaceAll("\n", "<br>") %></h3>
	</div>
</div>
</body>
</html>