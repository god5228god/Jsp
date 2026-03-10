<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberInsertForm.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css" /> -->
<link rel="stylesheet" type="text/css" href="css/MemberListScore.css" />
<script type="text/javascript">
	
	function memberSubmit()
	{
		// 확인
		//alert("확인");
		
		let memberForm = document.getElementById("memberForm");
		
		let uName = document.getElementById("uName");
		let nameMsg = document.getElementById("nameMsg");
		
		nameMsg.style.display = "none";
		
		if(uName.value == ""){
			nameMsg.style.display = "inline";
			uName.focus();
			return;		//-- memberSubmit()함수 종료
		}
		
		// form을 직접 지정하여 submit 액션 수행
		memberForm.submit();

	}
	
	function memberReset()
	{
		//alert("확인");
		
		let memberForm = document.getElementById("memberForm");

		let nameMsg = document.getElementById("nameMsg");
		
		nameMsg.style.display = "none";

		uName.focus();
		
		memberForm.reset();
	}
	
</script>
</head>
<body>
<div>
	<!-- 페이지 정체성 -->
	<h1>회원 <span style="color:green;">명단</span> 관리 및 입력 페이지</h1>
	<hr />
</div>
<div>
	<!-- 기본 메뉴 구성(기능별 페이지 이동) -->
	<a href="MemberList.jsp"><button>회원 명단 관리</button></a>
</div>
<br />
<div>
	<!-- 회원 데이터 입력 폼 구성 -->
	<form action="MemberInsert.jsp" method="post" id="memberForm">
		<table class="table">
			<tr>
				<th>이름(*)</th>
				<td>
					<input type="text" id="uName" name="uName"/>
				</td>
				<td>
					<span class="errMsg" id="nameMsg">이름을 입력해야 합니다.</span>
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>
					<input type="text" id="uTel" name="uTel"/>
				</td>
				<td>
				</td>
			</tr>
		</table>
		<br>
		
		<!-- <button type="button" onclick="memberSubmit()">입력하기</button> -->
		<a href="javascript:memberSubmit()"><button type="button">입력하기</button></a>
		<a href="javascript:memberReset()"><button type="button">취소하기</button></a>
		<a href="MemberList.jsp"><button type="button">목록으로</button></a>
		
	
	</form>
</div>
</body>
</html>