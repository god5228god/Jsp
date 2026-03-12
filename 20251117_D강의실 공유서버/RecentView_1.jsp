<%@page import="java.net.URLDecoder"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String pName = request.getParameter("pName");
	
	if (pName == null)
	{
		response.sendRedirect("ProductList.jsp");
		return;
	}
		
	// 1. 기존의 "recentList" 쿠키 찾기
	String oldList = "";
	Cookie[] cookies = request.getCookies();
	
	if (cookies != null)
	{
		for (Cookie c : cookies)
		{
			if (c.getName().equals("recentList"))
			{
				oldList = URLDecoder.decode(c.getValue(), "UTF-8");
				break;
			}
		}
	}
	
	// 2. 리스트 변환 및 새로운 상품 추가 (중복 제거 포함)
	// 예) "아이폰|맥북" → ["아이폰", "맥북"]
	List<String> items = new ArrayList<>();
	if (!oldList.isEmpty())
	{
		items.addAll(Arrays.asList(oldList.split("\\|")));
	}
	
	// check~!!!
	// 이미 목록에 있다면 삭제
	// → 방금 본 것(가장 마지막에 본 것)을 맨 위로 올리기 위해 처리
	items.remove(pName);
	
	// 맨 앞에 추가
	items.add(0, pName);
	
	// 3. 최대 3개까지만 유지
	if (items.size() > 3)
		items = items.subList(0, 3);	//-- 0, 1, 2 까지만 잘라서 items 에 대입
	
	// 4. 리스트를 다시 문자열로 결합 → 구분자 『"|"』
	String newList = String.join("|", items);
	
	// 5. 쿠키 저장 → 인코딩 필수~!!!
	Cookie c = new Cookie("recentList", URLEncoder.encode(newList, "UTF-8"));
	//c.setMaxAge(60 * 60 * 24); // 24시간	
	c.setMaxAge(60 * 3); // 3분	
	c.setPath(request.getContextPath());
	
	response.addCookie(c);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RecentView.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript">

	alert("<%=pName %> 상품을 확인했습니다.");
	location.href = "ShowRecent_1.jsp"; // 목록 확인 페이지로 이동
	
</script>
</head>
<body>

	<%-- 
	<div>
		<p><%=productName%>
			상품을 확인하셨습니다.
		</p>
		<a href="ShowRecent.jsp">장바구니 최근 본 상품으로 이동</a>
	</div> 	
 	--%>
</body>
</html>