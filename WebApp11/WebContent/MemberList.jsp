<%@page import="java.sql.Connection"%>
<%@page import="com.test.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	
	StringBuilder sb = new StringBuilder();
	MemberDAO dao = new MemberDAO();

	try{
		dao.connection();
		ArrayList<MemberDTO> list = dao.list();
		
		
		sb.append("<table class='table'>");
		sb.append("	<tr>");
		sb.append("		<th style='width: 50px;'>번호</th>");
		sb.append("		<th style='width: 100px;'>이름</th>");
		sb.append("		<th style='width: 150px;'>전화번호</th>");
		sb.append("		<th style='width: 200px;'>회원관리</th>");
		sb.append("	</tr>");
	
		for(MemberDTO member:list){		
			sb.append("	<tr>");
			sb.append("		<td>"+member.getSid()+"</td>");
			sb.append("		<td>"+member.getName()+"</td>");
			sb.append("		<td>"+member.getTel()+"</td>");
			sb.append("		<td>");
			/* 문자열 구성 과정에서 따옴표 처리 유의할 것! Check */
/* 			sb.append("			<a href='MemberUpdateForm.jsp'>"); */
			sb.append("			<a href='MemberUpdateForm.jsp?sid="+ member.getSid() +"'>");
			sb.append("            <button type='button' class='btnSmallAct'>수정</button>");
			sb.append("         </a>");
			sb.append("<a href='javascript:memberDelete(\"" + member.getSid() + "\", \"" + member.getName() + "\")' id='remove'>");
			sb.append(				"<button type='button' class='btnSmallAct'>삭제</button></a>");
			sb.append("		</td>");
			sb.append("	</tr>");
		}
		
		
		sb.append("</table>");
		
	}catch(Exception e){
		System.out.print(e.toString());
	}

	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberList.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css" /> -->
<link rel="stylesheet" type="text/css" href="css/MemberListScore.css" />
<script type="text/javascript">
	function memberDelete(sid, name)
	{
		//alert("확인");
		//alert(sid);
		
		//let aTag = document.getElementById("remove");
		
		if(confirm("번호: " +sid+ ", 이름: "+ name+"\n의 회원 정보를 정말 삭제하시겠습니까?"))
		{
			//alert("삭제 완료");
			// MemberDelete.jsp로 sid 전달
			window.location.href = "MemberDelete.jsp?sid="+sid;
			//aTag.click();
			
		}else{
			alert("삭제 취소");
		}
		
		
	}

</script>
</head>
<body>
<div>
	<!-- 페이지 정체성 -->
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
	<%= sb.toString() %>
<!-- 	<table class="table">
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
	</table> -->
</div>

</body>
</html>