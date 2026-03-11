<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	Cookie[] cookieArr = request.getCookies();
	
	String userId = "";
	if(cookieArr != null){
		for(Cookie c : cookieArr){
			if(c.getName().equals("userId"))
				userId = c.getValue();
		}
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LoginForm.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css" />
<style type="text/css">
body{background-color: #f0f0; }
.errMsg{font-size: 14px; display: none; color: red;}
.table{width: 500px; height:100px; margin: 0 auto;   padding: 20px; margin-top: 50px;}
.table th{width: 100px; height: 40px; border: none; background-color: #fff;}
.table td{width: 400px;border: none; }
.inputBox{padding-left: 10px; box-sizing: border-box;}
.table .txt{width: 150px; padding-left: 10px; box-sizing: border-box;}
.table .btn{width: 300px; height: 40px; font-size: 18px; 
			font-weight: bold; border: none; background-color: #000; color: #fff;
			cursor: pointer;}
.btn:hover{background-color: #eee; color: #000;}
#remember{margin-left: 80px; cursor: pointer;}
#remeber+label{font-size: 14px;}
</style>
<script type="text/javascript">
	
	function sendIt()
	{

		let f = document.forms[0];
		
		let id = document.getElementById("userId");
		let pwd = document.getElementById("userPwd");
		
		let idMsg = document.getElementById("idMsg");
		let pwdMsg = document.getElementById("pwdMsg");
		
		idMsg.style.display="none";
		pwdMsg.style.display="none";
		
		if(id.value.trim()==""){
			idMsg.style.display="inline";
			id.focus();
			return;
		}
		if(pwd.value.trim()==""){
			pwdMsg.style.display="inline";
			pwd.focus();
			return;
		}

		f.submit();		
	}
</script>
</head>
<body>
<!-- 
	○ Cookie 활용
	
	- LoginForm.jsp 페이지에서는
	 사용자로부터 아이디와 패스워드를 입력받을 수 있는
	 레이아웃을 구성하는데, 
	 이 과정에서 아이디 기억하기(7일간) 옵션 선택이 가능하도록 처리한다.
	 
	- CookieLogin.jsp 페이지에서는
	  사용자에게 아이디가 기억되었다는 안내와 
	  이전 LoginForm.jsp 페이지로 돌아가는 레이아웃을 구성하는데,
	  이 과정에서 넘겨 받은 아이디를 Cookie를 활용하여 보관할 수 있도록 처리한다.
	  
	- 위의 과정을 거친 사용자가
	  다시 LoginForm.jsp 페이지를 방문할 경우
	  저장된 아이디를(7일간) 사용할 수 있도록 처리한다.
 -->
 <div>
 	<form action="CookieLogin.jsp" method="post">
 		<table class="table">
 			<tr>
 				<th>아이디</th>
 				<td class="inputBox">
 					<input type="text" class="txt" name="userId"  id= "userId" value="<%=userId%>"/>
 					<span class="errMsg" id="idMsg">아이디를 입력하세요</span>
 				</td>
 			</tr>
 			<tr>
 				<th>패스워드</th>
 				<td class="inputBox">
 					<input type="password" class="txt" name="userPwd" id="userPwd" />
 					<span class="errMsg" id="pwdMsg">패스워드를 입력하세요</span>
 				</td>
 			</tr>
 			<tr>
 				<td colspan="2" >
 					<input type="checkbox" id="remember" name="check" />
 					<label for="remember">아이디 기억하기(7일간)</label>
 				</td>
 			</tr>
 			<tr>
 				<td colspan="2">
 					<button type="button" class="btn" onclick="sendIt()">로그인</button>
 				</td>
 			</tr>
 		</table>
 	</form>
 </div>
</body>
</html>