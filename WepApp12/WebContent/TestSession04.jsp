<%@ page contentType="text/html; charset=UTF-8"%>
<%
	
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String tel = request.getParameter("tel");
	
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
	function testSubmit()
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
	<form action="TestSession05.jsp" method="post" name="form04">
		<table>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="id" class="txt"/></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="text" name="pwd" class="txt"/></td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="button" class="btn" onclick="testSubmit()">입력</button>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>