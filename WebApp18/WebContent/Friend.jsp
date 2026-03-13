<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Friend.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css" />
<link rel="stylesheet" type="text/css" href="css/custom.css" />
<style type="text/css">
.wrap{width: 500px;}
table{position: relative;}
h1{text-align: center;}
hr{border: 1px solid #3fa4fc;}



</style> 
<script type="text/javascript">
	function sendIt()
	{
		let f = document.myForm;
		
		let name = document.getElementById("userName");
		let age = document.getElementById("userAge");
		let errName = document.getElementById("errName");
		let errAge = document.getElementById("errAge");
		
		errName.style.display = "none";
		errAge.style.display = "none";
		
		let flag = true;
		let isFocused = false;
		
		if(name.value.trim() == ""){			
			errName.style.display = "inline";
			if(!isFocused){
				name.focus();
				isFocused = true;				
			}
			flag = false;
		}
		if(isNaN(age.value) || age.value.trim()==""){			
			errAge.style.display = "inline";
			if(!isFocused){
				age.focus();
				isFocused = true;				
			}
			flag = false;
		}
		
		if(!flag)
			return;
		
		
		f.submit();
		
	}
</script>
</head>
<body>
<div class="wrap">
	<div>
		<h1>데이터 입력</h1>
		<hr />
	</div>
	<!--
		○ 물리적 파일 구성
		- Friend.jsp
		  → 이름(*), 나이, 성별(radio, 남/여)
		  	, 이상형(check, 고윤정, 김민정, 아이유, 강동원, 송강, 김태희, 카리나, 박보영)
		- com.test.FriendBean
		 → Java Bean
		- Friend_ok.jsp
		 → 데이터 수신 , 객체 생성, 결과 화면 구성
	  -->
	  
	<div>
		<form action="Friend_ok.jsp" method="post" name="myForm">
			<table>
				<tr>
					<th>이름(*)</th>
					<td>
						<input type="text" name="userName" id="userName" class="inTxt" /><br>
						<span class="errMsg" id="errName">이름을 입력하세요.</span>
					</td>
				</tr>
				<tr>
					<th>나이</th>
					<td>
						<input type="text" name="userAge" id="userAge" class="inTxt" /><br>
						<span class="errMsg" id="errAge">나이는 숫자로 입력하세요.</span>
					</td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<label for="male">남자</label>
						<input type="radio" name="gender" id="male" checked="checked" value="남자"/>
						<label for="female">여자</label>
						<input type="radio" name="gender"  id="female" value="여자"/>
					</td>
				</tr>
				<tr>
					<th>이상형</th>
					<td>
						<input type="checkbox" name="iden" id="iden1" value="고윤정"/>
						<label for="iden1">고윤정</label><br>
						<input type="checkbox" name="iden" id="iden2" value="김민정"/>
						<label for="iden2">김민정</label><br>
						<input type="checkbox" name="iden" id="iden3" value="아이유"/>
						<label for="iden3">아이유</label><br>
						<input type="checkbox" name="iden" id="iden4" value="강동원"/>
						<label for="iden4">강동원</label><br>
						<input type="checkbox" name="iden" id="iden5" value="송강"/>
						<label for="iden5">송강</label><br>
						<input type="checkbox" name="iden" id="iden6" value="김태희"/>
						<label for="iden6">김태희</label><br>
						<input type="checkbox" name="iden" id="iden7" value="카리나"/>
						<label for="iden7">카리나</label><br>
						<input type="checkbox" name="iden" id="iden8" value="박보영"/>
						<label for="iden8">박보영</label><br>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<button type="button" onclick="sendIt()" class="btns">입력</button>
					</td>
				</tr>
			</table>
		</form>
	</div>  
</div>

</body>
</html>