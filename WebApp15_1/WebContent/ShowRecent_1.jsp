<%@page import="java.net.URLDecoder"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	/* 
	String recentItem = "아직 본 상품이 없습니다.";
	Cookie[] cookies = request.getCookies();
	if (cookies != null)
	{
		for (Cookie c : cookies)
		{
			if (c.getName().equals("recentProduct"))
			{
				// 저장할 때 URLEncoder를 썼으므로, 읽을 때는 URLDecoder가 필수!
				//recentItem = URLDecoder.decode(c.getValue(), "UTF-8");
				recentItem = c.getValue();
			
				break;
			}
		}
	}
	*/
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ShowRecent.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	.item-tag
	{
		display: inline-block;
		padding: 10px 20px;
		margin: 5px;
		background: #e1f5fe;
		border: 1px solid #03a9f4;
		border-radius: 20px;
	}
	.btn-view
	{
		text-decoration: none;
		padding: 8px 15px;
		background-color: #3498db;
		color: white;
		border-radius: 5px;
		font-size: 14px;
	}
	.btn-view:hover { background-color: #2980b9; }
	.recent-box
	{
		margin-top: 50px;
		text-align: center;
		padding: 20px;
		background: #eee;
		border-radius: 10px;
	}
</style>
</head>
<body>

	<div>
		<!-- <h1>당신이 방금 본 상품은</h1> -->
		<h1>최근 본 상품 목록(최대 3개)</h1>
		<p>ShowRecent.jsp</p>
		<hr>
	</div>

	<div>
		<div id="recent-container">
		<%
			Cookie[] cookies = request.getCookies();
			boolean hasCookie = false;
			if (cookies != null)
			{
				for (Cookie c : cookies)
				{
					if (c.getName().equals("recentList"))
					{
						String val = URLDecoder.decode(c.getValue(), "UTF-8");
						String[] items = val.split("\\|");
						
						for (String item : items)
							out.println("<span class='item-tag'>" + item + "</span>");
						
						hasCookie = true;
						break;
					}
				}
			}
			if (!hasCookie)
				out.println("<p>기록이 없습니다.</p>");
		%>
		</div>
		<br>
		
		<div class="recent-box">		
			<a href="ProductList.jsp" class="btn-view"
			style="color: #2c3e50; background-color: white; font-weight: bold;">
			계속 쇼핑하기
			</a>
		</div>
	</div>

</body>
</html>