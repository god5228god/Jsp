<%@page import="java.net.URLDecoder"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String recentItem = "아직 본 상품이 없습니다.";
	Cookie[] cookies = request.getCookies();
	if (cookies != null)
	{
		for (Cookie c : cookies)
		{
			if (c.getName().equals("recentProduct"))
			{
				// 인코딩 처리 이전
				//recentItem = c.getValue();
				
				// 저장할 때 URLEncoder를 썼으므로, 읽을 때는 URLDecoder가 필수!
				recentItem = URLDecoder.decode(c.getValue(), "UTF-8");
								
				break;	
			}
		}
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ShowRecent.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h2>당신이 방금 본 상품은</h2>
	<p>ShowRecent.jsp</p>
	<hr>
</div>
	
<div>
    <p style="font-size: 20px; color: blue;">
    	<strong><%= recentItem %></strong>
    </p>
    <hr>
    <br>
    <a href="ProductList.jsp">다시 쇼핑하러 가기</a>
</div>

</body>
</html>