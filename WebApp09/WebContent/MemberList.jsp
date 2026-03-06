<%@page import="java.util.ArrayList"%>
<%@page import="com.test.MemberDTO"%>
<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	 MemberDAO dao = new MemberDAO();

	ArrayList<MemberDTO> mList = dao.list();

	int count = dao.count();


	// 문자열 결합
	StringBuilder sb = new StringBuilder();
	sb.append("<table class='table'>");
	sb.append("<tr>");
	sb.append("			<th>번호</th>");
	sb.append("			<th>이름</th>");
	sb.append("			<th>전화번호</th>");
	sb.append("		</tr>");
	
	for(MemberDTO d:mList)
	{
		sb.append("<tr>");
		sb.append("			<td class='record'>"+d.getSid()+"</td>");
		sb.append("			<td class='record'>"+d.getName()+"</td>");
		sb.append("			<td class='record'>"+d.getTel()+"</td>");
		sb.append("		</tr>");
	}
	
	sb.append("	</table>"); 
	
/* 	// 모범 답안
	StringBuffer str = new StringBuffer();
	MemberDAO dao = null;
	
	String memberCount = "";
	try
	{
		dao = new MemberDAO();
		
		memberCount += dao.count()+ "명</span>";
		
		str.append("<table class='table'>");
		str.append("<tr>");
		str.append("			<th>번호</th>");
		str.append("			<th>이름</th>");
		str.append("			<th>전화번호</th>");
		str.append("		</tr>");
		

		for(MemberDTO member:dao.list())
		{
			str.append("<tr>");
			str.append("			<td class='record'>"+member.getSid()+"</td>");
			str.append("			<td class='record'>"+member.getName()+"</td>");
			str.append("			<td class='record'>"+member.getTel()+"</td>");
			str.append("		</tr>");
		}
		
		str.append("	</table>");
		
	}catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			// 데이터베이스 연결 종료
			//DBConn.close();	
			dao.close();
		}catch(Exception e)
		{
			System.out.println(e.toString());
			
		}
	} */
	

	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberList.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css" />
<style type="text/css">
	.recode{text-align: center;}
	input{width: 200px; border-radius: 6px; padding-left: 5px;}
	button{width: 380px; height: 40px; font-family: "맑은고딕"; font-weight: bold;}
	.errMsg{font-size: small; color: red; display: none;}
	.inputTh{width: 140px; }
	#memberCount{margin-bottom: 5px;}
</style>
<script type="text/javascript">
	function formCheck()
	{
		let name = document.getElementById("userName");
		let errMsg = document.getElementById("nameMsg");
		
		errMsg.style.display = "none";
		
		if(name.value == ""){
			errMsg.style.display ="inline";
			name.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
<div>
	<h1>데이터베이스 연동 회원관리 실습</h1>
	<p>DAO, DTO 개념 적용</p>
	<hr />
</div>
<div>
	<form action="MemberInsert.jsp" method="post" onsubmit="return formCheck()">
		<table class="table">
			<tr>
				<th class="inputTh">이름(*)</th>
				<td>
					<input type="text" id="userName" name="userName" class="txt"/>
					<span class="errMsg" id="nameMsg">이름을 입력해야 합니다.</span>
				</td>
			</tr>
			<tr>
				<th class="inputTh">전화번호</th>
				<td>
					<input type="text" id="userTel" name="userTel" class="txt"/>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit" id="btnAdd" class="btn control">회원 추가</button>
				</td>
			</tr>
		</table>
	</form>
</div>
<br /><br />
<div>
	
	<span id="memberCount">전체 인원 수: <%= count %>명</span>
	<br>
	<!-- 번호, 이름, 전화번호 항목에 대한 전체 리스트 출력  -->
	<%= sb.toString() %>
<!-- 	<table class="table">
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>전화번호</th>
		</tr>
		<tr>
			<td class="record">1</td>
			<td class="record">고길동</td>
			<td class="record">010-9999-8888</td>
		</tr>
			<tr>
			<td class="record">2</td>
			<td class="record">도우너</td>
			<td class="record">010-5555-8888</td>
		</tr>
			<tr>
			<td class="record">3</td>
			<td class="record">마이콜</td>
			<td class="record">010-1111-8888</td>
		</tr>
	</table> -->
</div>


</body>
</html>