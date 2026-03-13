<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="ob" class="com.model.UserBean" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RegisterResult.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css" />
<link rel="stylesheet" type="text/css" href="css/custom.css" />
<style type="text/css">
.wrap{width: 300px; margin: 50px auto 15px}
.box{width: 100%; display: flex; margin-bottom: 5px; padding-left: 5px; }
hr{margin-bottom: 20px;}
.label{width: 80px; line-height: 30px; font-weight: bold;}
.header{margin-top: 20px; }
.header h1{color: #999; font-style: italic; font-size: 40px; font-weight: normal; }
.wrap h1{margin-bottom: 10px;}
.btns{margin-top: 20px;}
.inTxt{width: 200px;}
.input{height: 30px; line-height: 30px;}
a{color: #666; display: block; text-align: center; }
</style>
</head>
<body>
	<div class="header">
		<jsp:include page="Header.jsp">
			<jsp:param value="회원정보 확인" name="title"/>
		</jsp:include>
	
	</div>
	<div class="wrap">
		<h1>회원정보</h1>
		<hr />
		<div>
			<div class="box">
				<div class="label">아이디</div>
				<div class="input">
					<jsp:getProperty property="userId" name="ob"/>
				</div>
			</div>
			<div class="box">
				<div class="label">이름</div>
				<div class="input">
					<jsp:getProperty property="userName" name="ob"/>
				</div>
			</div>
			<div class="box">
				<div class="label">이메일</div>
				<div class="input">
					<jsp:getProperty property="userEmail" name="ob"/>
				</div>
			</div>
	</div>
	</div>
	
	<a href="RegisterForm.jsp">회원가입 페이지로 이동</a>
</body>
</html>