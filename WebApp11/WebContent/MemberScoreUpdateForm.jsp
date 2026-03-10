<%@page import="com.test.MemberScoreDTO"%>
<%@page import="com.test.MemberScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String sid = request.getParameter("sid");
	String name = "";
	int kor = 0;
	int eng = 0;
	int mat = 0;
	MemberScoreDAO dao = new MemberScoreDAO();
	
	try
	{
		dao.connection();
		
		MemberScoreDTO score = dao.search(sid);
		
		name = score.getName();
		kor = score.getKor();
		eng = score.getEng();
		mat = score.getMat();
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			dao.close();
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberScoreUpdateForm.jsp</title>
<link rel="stylesheet" type="text/css" href="css/MemberListScore.css" />
<script type="text/javascript">

	function memberScoreSubmit()
	{
		let memberScoreUpdateForm = document.getElementById("memberScoreUpdateForm");
		
		let kor = document.getElementById("kor");
		let eng = document.getElementById("eng");
		let mat = document.getElementById("mat");
		
		let korMsg = document.getElementById("korMsg");
		let engMsg = document.getElementById("engMsg");
		let matMsg = document.getElementById("matMsg");
		
		let korVal = Number(kor.value);
		let engVal = Number(eng.value);
		let matVal = Number(mat.value);
		
		let flag = true;
		let isFocused = false;
		
		korMsg.style.display = "none";
		engMsg.style.display = "none";
		matMsg.style.display = "none";
		
		if(kor.value =="" || korVal < 0 || korVal >100 || isNaN(korVal))
		{
			korMsg.style.display = "inline";
			if(!isFocused){
				isFocused = true;
				kor.focus();
			}
			flag = false;
			
		}
		if(eng.value =="" || engVal < 0 || engVal >100 || isNaN(engVal))
		{
			engMsg.style.display = "inline";
			if(!isFocused){
				isFocused = true;
				eng.focus();
			}
			flag = false;
			
		}
		if(mat.value =="" || matVal < 0 || matVal >100 || isNaN(matVal))
		{
			matMsg.style.display = "inline";
			if(!isFocused){
				isFocused = true;
				mat.focus();
			}
			flag = false;
			
		}
		
		if(!flag)
			return false;
		
		memberScoreUpdateForm.submit();
	}
	
	function memberScoreReset()
	{
		let memberScoreUpdateForm = document.getElementById("memberScoreUpdateForm");
		let kor = document.getElementById("kor");
		
		let korMsg = document.getElementById("korMsg");
		let engMsg = document.getElementById("engMsg");
		let matMsg = document.getElementById("matMsg");
		
		korMsg.style.display = "none";
		engMsg.style.display = "none";
		matMsg.style.display = "none";
		
		memberScoreUpdateForm.reset();
		kor.focus();
	}

</script>
</head>
<body>
<div>
	<!-- 페이지 정체성 -->
	<h1>회원 <span style="color:blue;">성적</span> 관리 및 수정 페이지</h1>
	<hr />
</div>
<div>
	<!-- 기본 메뉴 구성(기능별 페이지 이동) -->
	<a href="MemberScoreList.jsp"><button>회원 성적 관리</button></a>
</div>
<br />
<div>
	<!-- 회원 데이터 수정 폼 구성 -->
	<form action="MemberScoreUpdate.jsp?sid=<%=sid %>" method="post" id="memberScoreUpdateForm">
		<table class="table">
			<tr>
				<th>번호</th>
				<td>
					<%= sid %>
				</td>
				<td></td>
			</tr>
			<tr>
				<th>이름</th>
				<td>
					<%= name %>
				</td>
				<td></td>
			</tr>
			<tr>
				<th>국어점수</th>
				<td>
					<input type="text" id="kor" name="kor" value="<%=kor %>" class="txtScore"/>
				</td>
				<td>
					<span class="errMsg" id="korMsg">0 ~ 100 사이의 국어점수를 입력해야 합니다.</span>
				</td>
			</tr>
			<tr>
				<th>영어점수</th>
				<td>
					<input type="text" id="eng" name="eng" value="<%=eng %>"  class="txtScore"/>
				</td>
				<td>
					<span class="errMsg" id="engMsg">0 ~ 100 사이의 영어점수를 입력해야 합니다.</span>
				</td>
			</tr>
			<tr>
				<th>수학점수</th>
				<td>
					<input type="text" id="mat" name="mat" value="<%=mat %>"  class="txtScore"/>
				</td>
				<td>
					<span class="errMsg" id="matMsg">0 ~ 100 사이의 수학점수를 입력해야 합니다.</span>
				</td>
			</tr>
			
		</table>
		<br>
		
		<a href="javascript:memberScoreSubmit()"><button type="button">수정하기</button></a>
		<a href="javascript:memberScoreReset()"><button type="button">되돌리기</button></a>
		<a href="MemberScoreList.jsp"><button type="button">목록으로</button></a>
		
	
	</form>
</div>
</body>
</html>