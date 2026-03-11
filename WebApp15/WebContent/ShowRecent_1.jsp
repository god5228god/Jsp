<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	Cookie[] cookieArr = request.getCookies();
	
	String title = "";
	String author = "";
	String publisher = "";
	String[] tArr = null;
	
	if(cookieArr != null){		
		for(Cookie c:cookieArr)
		{			
			if(c.getName().equals("title"))
				tArr = c.getValue().split("/");
		}
	}


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ShowRecent_1.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css" />
</head>
<body>
<div>
	<form action="ProductList.jsp">
		<table>
			<tr>
				<th>제목</th>
				<%
					for(String s:tArr)
					{
						if(s!=null&& !s.equals("")){
				%>
				<td><%= s %></td>
				<%
						}
					}
				%>
			</tr>
<%-- 			<tr>
				<th>작가</th>
				<td><%= author %></td>
			</tr>
			<tr>
				<th>출판사</th>
				<td><%= publisher %></td>
			</tr> --%>
			<tr>
				<td colspan="2">
					<button type="submit" class="btn">도서 목록으로</button>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>