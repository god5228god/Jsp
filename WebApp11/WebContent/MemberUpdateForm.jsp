<%@page import="com.test.MemberDTO"%>
<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지(MemberList.jsp)로부터 넘어온 데이터 수신
	//-- sid
	
	// ※ 수신한 sid를 가지고 회원 데이터 조회
	//	  이를 통해 얻어낸 데이터를 활용하여 폼의 내용 구성
	
	String sid = request.getParameter("sid");
	String name = "";
	String tel = "";
	
	MemberDAO dao = new MemberDAO();

	
	try
	{
		// 데이터베이스 연결
		dao.connection();
		
		// 수정 대상 확인
		MemberDTO member = dao.searchMember(sid);
		
		name = member.getName();
		tel = member.getTel();
		
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			// 데이터베이스 연결 종료
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
	<h1>회원 <span style="color:green;">성적</span> 관리 및 수정 페이지</h1>
	<hr />
</div>
<div>
	<!-- 기본 메뉴 구성(기능별 페이지 이동) -->
	<a href="MemberList.jsp"><button>회원 명단 관리</button></a>
</div>
<br />
<div>
	<!-- 회원 데이터 수정 폼 구성 -->
	<!-- <form action="MemberUpdate.jsp" method="post" id="memberForm"> -->
	<!-- Case 3. -->
	<form action="MemberUpdate.jsp?sid=<%= sid %>" method="post" id="memberForm">
		<table class="table">
			<!-- Case 1. -->
			<%-- 
			<tr>
				<th>번호</th>
				<td>
					<input type="text" id="sid" name="sid" value="<%= sid%>" disabled="disabled"/>
				</td>
			</tr>
			 --%>
			<tr>
				<th>이름(*)</th>
				<td>
					<input type="text" id="uName" name="uName" value="<%= name%>"/>
				</td>
				<td>
					<span class="errMsg" id="nameMsg">이름을 입력해야 합니다.</span>
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>
					<input type="text" id="uTel" name="uTel" value="<%= tel%>"/>
				</td>
				<td>
				</td>
			</tr>
		</table>
		<br>
		<!-- Case 2. -->
		<%-- <input type="hidden" name="sid" value="<%= sid %>" /> --%>
		
		<a href="javascript:memberSubmit()"><button type="button">수정하기</button></a>
		<a href="javascript:memberReset()"><button type="button">취소하기</button></a>
		<a href="MemberList.jsp"><button type="button">목록으로</button></a>
		
	
	</form>
</div>
</body>
</html>