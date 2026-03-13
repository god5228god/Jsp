<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="ob" class="com.test.FriendBean"></jsp:useBean>
<jsp:setProperty property="*" name="ob"/>

<!-- 
	Check!
	다중 선택으로 넘어온 결과값 처리 → 반복문 구성
 -->
 <%
 	String str = "";
 	if(ob.getIden() != null){
 		for(String temp : ob.getIden()){
 			str += "[" +temp +"] ";
 		}
 	}
 %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Friend_ok.jspe</title>
<link rel="stylesheet" type="text/css" href="css/main.css" />
<link rel="stylesheet" type="text/css" href="css/custom.css" />
<style type="text/css">
.wrap{width: 600px;}
.box{width: 70%; margin: 20px auto; text-align: center;}
</style>
</head>
<body>
<div class="wrap">
	<div>
		<h1>결과확인</h1>
		<hr />
	</div>
	<div class="box">
		<h3>이름: <%=ob.getUserName() %></h3>
		<h3>나이: <%=ob.getUserAge() %></h3>
		<h3>성별: <%=ob.getGender() %></h3>
		<h3>이상형: 
<%-- 		<% for( String iden : ob.getIden()){
		%>
			<%=iden %>
		<%
		}%> --%>
		<%=str %>
		</h3>

	</div>
</div>
	
</body>
</html>