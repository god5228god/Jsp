<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send14.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css" />
</head>
<body>
<div>
	<h1>데이터 송수신 실습 14</h1>
	<p>포워딩 및 리다이렉트</p>
	<hr />
</div>
<!-- Send14.jsp → Send14Redirect.jsp → Receive14.jsp -->
<!-- Send14.jsp → Send14Forward.jsp  → Receive14.jsp -->

<!-- 사용자 최초 요청 페이지  -->
<!--  http://localhost:3306/WebApp06/Send14.jsp  -->

<div>
	<!-- Check! action 처리에 대한 분기 -->
	<!-- <form action="" method="post" id="testForm"> -->
	<!-- <form action="Send14Redirect.jsp" method="post" id="testForm"> -->
	<form action="" method="post" id="testForm">
		이름 <input type="text" name="userName" class="txt" />
		<br><br>
		
		<!-- <button type="submit" class="btn" style="width: 200px">리다이렉트</button> -->
		<button type="submit" class="btn" style="width: 200px" 
		onclick="this.form.action='Send14Redirect.jsp'">리다이렉트</button>
		
		<!-- <button type="submit" class="btn" style="width: 200px">포워드</button> -->
		<button type="submit" class="btn" style="width: 200px"
		onclick="this.form.action='Send14Forward.jsp'">포워드</button>
		
	</form>
</div>

</body>
</html>