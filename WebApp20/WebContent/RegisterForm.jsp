<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	Boolean mode = (Boolean)application.getAttribute("isMaintenance");
	String msg = (String)application.getAttribute("msg");
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RegisterForm.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css" />
<link rel="stylesheet" href="css/custom.css" type="text/css"/>
<style type="text/css">
.wrap{width: 300px;}
.box{width: 100%; display: flex; margin-bottom: 5px; padding-left: 5px; }
hr{margin-bottom: 20px;}
.label{width: 80px; line-height: 30px;}
.header{margin-top: 20px; }
.header h1{color: #999; font-style: italic; font-size: 40px; font-weight: normal; }
.wrap h1{margin-bottom: 10px;}
.btns{margin-top: 20px;}
.inTxt{width: 200px;}
a{color: #666; display: block; text-align: center; }
.warnWrap{width: 80%;  }
.warnig{width: 80%;  border: 2px solid #e04866; background-color: #ed9198; 
	text-align: center; margin: auto; color: #595051;
	 padding: 0 5px; box-sizing: border-box;
}
</style>
</head>
<body>
<%
	if(mode){
%>
<div class="wrap warnWrap">
	<h1>점검중</h1>
	<hr />
	<h2 class="warnig">안내: <%=msg %></h2>
</div>

<%}else{ %>
	<div class="header">
		<jsp:include page="Header.jsp">
			<jsp:param value="회원가입" name="title"/>
		</jsp:include>
	</div>
<div class="wrap">
	<h1>회원가입 폼</h1>
	<hr />
	<div>
		<form action="RegisterProcess.jsp" method="post">
			<div class="box">
				<div class="label">아이디</div>
				<div class="input">
					<input type="text" class="inTxt" name="userId"/>
				</div>
			</div>
			<div class="box">
				<div class="label">이름</div>
				<div class="input">
					<input type="text" class="inTxt" name="userName"/>
				</div>
			</div>
			<div class="box">
				<div class="label">이메일</div>
				<div class="input">
					<input type="email" class="inTxt" name="userEmail" />
				</div>
			</div>
			<div>
				<button type="submit" class="btns">가입</button>
			</div>
		</form>
	</div>
</div>
<%} %>
	<a href="AdminSetting_1.jsp">관리자 페이지로 이동</a>
</body>
</html>