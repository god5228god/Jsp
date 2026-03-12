<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String productName = request.getParameter("pName"); // "맥북", "아이폰" 등
	
	// 상품명을 쿠키로 저장(인코딩 처리 이전)
	//Cookie recentCookie = new Cookie("recentProduct", productName);
	
	// 쿠키 값에 한글이나 공백이 포함될 수 있으므로 반드시 인코딩 필요!
	String encodedName = URLEncoder.encode(productName, "UTF-8");
	
	// 상품명을 쿠키로 저장
	Cookie recentCookie = new Cookie("recentProduct", encodedName);
	
	recentCookie.setMaxAge(60 * 3); // 3분 유지
	
	response.addCookie(recentCookie);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RecentView.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<p><%= productName %> 상품을 확인하셨습니다.</p>
	<a href="ShowRecent.jsp">
		<button type="button">장바구니 최근 본 상품으로 이동</button>
	</a>
</div>

</body>
</html>