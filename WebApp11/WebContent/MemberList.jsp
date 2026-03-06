<%@ page contentType="text/html; charset=UTF-8"%>
<%
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberList.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css" /> -->
<link rel="stylesheet" type="text/css" href="css/MemberListScore.css" />
</head>
<body>
<div>
	<!-- 페에지 정체성 -->
	<h1>회원 <span style="color:green;">명단</span> 관리 및 출력 페이지</h1>
	<hr />
</div>
<div>
	<!-- 기본 메뉴 구성(기능별 페이지 이동) -->
	<a href="MemberScoreList.jsp"><button>회원 성적 관리</button></a>
	<a href="MemberInsertForm.jsp"><button>신규 회원 등록</button></a>
</div>
<br />

<div>
	<!-- 리스트 출력 -->
	<table class="table">
		<tr>
			<th style="width: 50px;">번호</th>
			<th style="width: 100px;">이름</th>
			<th style="width: 150px;">전화번호</th>
			<th style="width: 200px;">회원관리</th>
		</tr>
		<tr>
			<td>1</td>
			<td>희동이</td>
			<td>010-1111-1111</td>
			<td>
				<a href=""><button type="button" class="btnSmallAct">수정</button></a>
				<a href=""><button type="button" class="btnSmallAct">삭제</button></a>
			</td>
		</tr>
				<tr>
			<td>2</td>
			<td>도우너</td>
			<td>010-2222-2222</td>
			<td>
				<a href=""><button type="button" class="btnSmallAct">수정</button></a>
				<a href=""><button type="button" class="btnSmallAct">삭제</button></a>
			</td>
		</tr>
				<tr>
			<td>3</td>
			<td>마이콜</td>
			<td>010-3333-3333</td>
			<td>
				<a href=""><button type="button" class="btnSmallAct">수정</button></a>
				<a href=""><button type="button" class="btnSmallAct">삭제</button></a>
			</td>
		</tr>
	</table>
</div>

</body>
</html>