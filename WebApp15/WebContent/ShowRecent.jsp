<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	Cookie[] cookieArr = request.getCookies();
	
	String title = "";
	String author = "";
	String publisher = "";
	
	if(cookieArr != null){		
		for(Cookie c:cookieArr)
		{
			if(c.getName().equals("title"))
				title = c.getValue();
			
			if(c.getName().equals("author"))
				author = c.getValue();
			
			if(c.getName().equals("publisher"))
				publisher = c.getValue();
			
		}
	}
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ShowRecent.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css" />
<style type="text/css">
.btn{border: none; background-color: #fce147; padding: 5px; font-weight: bold; 
color: #3d3b38; cursor: pointer; border-radius: 5px;}
.btn:hover{background-color: #3d3b38; color: #fce147; }
</style>
</head>
<body>
<div>
	<h1>최근 본 도서</h1>
	<hr />
</div>
<div>
	<form action="ProductList.jsp">
		<table>
			<tr>
				<th>제목</th>
				<td><%= title %></td>
			</tr>
			<tr>
				<th>작가</th>
				<td><%= author %></td>
			</tr>
			<tr>
				<th>출판사</th>
				<td><%= publisher %></td>
			</tr>
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