<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전페이지(TestSession03.jsp)로부터 넘어온 데이터 수신
	//-- name, tel
	
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	String tel = request.getParameter("tel");
	
	
	// Check!
	session.setAttribute("userName", name);
	session.setAttribute("userTel", tel);
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSession04.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css" />
<style type="text/css">
.txt{width: 150px;}
.btn{width: 100%; font-size: 16px; border:none; height: 30px; background-color: #a4bade; color: #fff; font-weight: bold;}
</style>
<script type="text/javascript">
	function sendIt()
	{
		let f = document.form04;
		
		if(!f.id.value){
			alert("아이디를 입력해주세요.");
			f.id.focus();
			return;
		}
		if(!f.pwd.value){
			alert("패스워드를 입력해주세요.");
			f.pwd.focus();
			return;
		}
		
		f.submit(); 
	}
</script>
</head>
<body>
<div>
	<h1>TestSession04.jsp</h1>
 	<p>아이디와 패스워드</p>
 	<hr />
</div>
<div>
	<form action="TestSession05.jsp" method="post" name="form04">
		<table>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="id" class="txt"/></td>
			</tr>
			<tr>
				<th>패스워드</th>
				<td><input type="password" name="pwd" class="txt"/></td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="button" class="btn" onclick="sendIt()">입력</button>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>