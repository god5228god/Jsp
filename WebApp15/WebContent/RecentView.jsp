<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String title = request.getParameter("title");
	String author = request.getParameter("author");
	String publisher = request.getParameter("publisher");
	String imgSrc = request.getParameter("imgSrc");

	String encodedTitle = URLEncoder.encode(title, "UTF-8");
	
	Cookie cTitle = new Cookie("title", title);
	Cookie cAuthor = new Cookie("author", author);
	Cookie cPublisher = new Cookie("publisher", publisher);
	
	cTitle.setMaxAge(60);
	cAuthor.setMaxAge(60);
	cPublisher.setMaxAge(60);
	
	response.addCookie(cTitle);
	response.addCookie(cAuthor);
	response.addCookie(cPublisher);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RecentView.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css" />
<style type="text/css">
.btn{border: none; background-color: #fce147; padding: 5px; font-weight: bold; 
color: #3d3b38; cursor: pointer; border-radius: 5px;}
.btn:hover{background-color: #3d3b38; color: #fce147; }
img{width: 150px;}
</style>
</head>
<body>
<div>
	<h1>상세보기</h1>
	<hr />
</div>
<div>
	<form action="ShowRecent.jsp">
		<table>
			<tr>
				<td>
					<img src="<%=imgSrc %>" alt="도서이미지" />				
				</td>
			</tr>
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
					<button type="submit" class="btn">최근 본 상품으로</button>
				</td>
			</tr>
		</table>
	</form>
</div>

</body>
</html>