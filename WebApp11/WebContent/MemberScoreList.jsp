<%@page import="com.test.MemberScoreDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.test.MemberScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	
	MemberScoreDAO dao = new MemberScoreDAO();
	StringBuffer str = new StringBuffer();
	
	try
	{
		dao.connection();
		ArrayList<MemberScoreDTO> list = dao.list();
		
		str.append("<table class='table'>");
		str.append("	<tr>");
		str.append("		<th class='numTh'>번호</th>");
		str.append("		<th class='nameTh'>이름</th>");
		str.append("		<th>국어점수</th>");
		str.append("		<th>영어점수</th>");
		str.append("		<th>수학점수</th>");
		str.append("		<th>총점</th>");
		str.append("		<th>평균</th>");
		str.append("		<th>석차</th>");
		str.append("		<th>성적처리</th>");
		str.append("	</tr>");
		
		for(MemberScoreDTO dto:list)
		{			
			str.append("	<tr>");
			str.append("		<td>"+dto.getSid()+"</td>");
			str.append("		<td>"+dto.getName()+"</td>");
			str.append("		<td class='txtScore'>"+dto.getKor()+"</td>");
			str.append("		<td class='txtScore'>"+dto.getEng()+"</td>");
			str.append("		<td class='txtScore'>"+dto.getMat()+"</td>");
			str.append("		<td class='txtScore'>"+dto.getTot()+"</td>");
			str.append("		<td class='txtScore'>"+String.format("%.2f", dto.getAvg())+"</td>");
			str.append("		<td class='txtScore'>"+dto.getRank()+"</td>");
			
			// 성적 처리 항목(입력, 수정, 삭제) 
			
			if(dto.getKor() == -1 && dto.getEng() == -1 && dto.getMat() == -1)	
			{
				// 성적 데이터 미입력 → 수정/삭제 불가, 입력만 가능
				str.append("		<td>");
				str.append("			<a href='MemberScoreInsertForm.jsp?sid="+dto.getSid()+"'>");
				str.append("				<button type='button' class='btnSmallAct'>입력</button>");
				str.append("			</a>");
				str.append("				<button type='button' class='btnSmallNon' disabled='disabled'>수정</button>");
				str.append("				<button type='button' class='btnSmallNon' disabled='disabled'>삭제</button>");
				
				str.append("		</td>");
			}
			else
			{	
				// 성적 데이터 입력 → 수정/삭제만 가능, 입력 불가
				str.append("		<td>");
				str.append("			<button type='button' class='btnSmallNon' disabled='disabled'>입력</button>");	
				str.append("			<a href='MemberScoreUpdateForm.jsp?sid="+dto.getSid()+"'>");
				str.append("				<button type='button' class='btnSmallAct'>수정</button>");	
				str.append("			</a>");
				str.append("			<a href='javascript:memberScoreDelete("+dto.getSid()+", \"" + dto.getName() +"\")'>");
				str.append("				<button type='button' class='btnSmallAct'>삭제</button>");	
				str.append("			</a>");
				str.append("		</td>");
				
				
			}
			
			str.append("	</tr>");
			
		}
		
		
		str.append("</table>");

	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberScore.jsp</title>
<link rel="stylesheet" type="text/css" href="css/MemberListScore.css" />
<script type="text/javascript">
	
	function memberScoreDelete(sid, name)
	{
		// ※ name 문자열을 넘기는 과정에서 따옴표 구성에 유의할 것!
		
		if(confirm("번호: "+sid +", 이름: "+name+"\n이 회원의 성적 데이터를 정말 삭제하시겠습니까?"))
			window.location.href = "MemberScoreDelete.jsp?sid="+sid;
		else
			alert("삭제가 취소되었습니다.");
		
		
	}

</script>
</head>
<body>
<div>
	<!-- 페에지 정체성 -->
	<h1>회원 <span style="color:red;">성적</span> 관리 및 출력 페이지</h1>
	<hr />
</div>
<div>
	<!-- 기본 메뉴 구성(기능별 페이지 이동) -->
	<a href="MemberList.jsp"><button>회원 명단 관리</button></a>
</div>
<br />

<div>
<%= str.toString() %>
<!-- 리스트 출력 -->
<!--  <table class="table">
	<tr>
		<th class="numTh">번호</th>
		<th class="nameTh">이름</th>
		<th>국어점수</th>
		<th>영어점수</th>
		<th>수학점수</th>
		<th>총점</th>
		<th>평균</th>
		<th>석차</th>
		<th>성적처리</th>
	</tr>
	<tr>
		<td>1</td>
		<td>강명철</td>
		<td>80</td>
		<td>70</td>
		<td>60</td>
		<td>210</td>
		<td>70.00</td>
		<td>1</td>
		<td>
			<a href="">
				<button type="button" class="btnSmallNon" disabled="disabled">입력</button>
			</a>
			<a href="">
				<button type="button" class="btnSmallAct">수정</button>
			</a>
			<a href="">
				<button type="button" class="btnSmallAct">삭제</button>
			</a>
		</td>
	</tr>
	<tr>
		<td>2</td>
		<td>안진모</td>
		<td>70</td>
		<td>70</td>
		<td>50</td>
		<td>190</td>
		<td>63.33</td>
		<td>2</td>
		<td>
			<a href="">
				<button type="button" class="btnSmallNon" disabled="disabled">입력</button>
			</a>
			<a href="">
				<button type="button" class="btnSmallAct">수정</button>
			</a>
			<a href="">
				<button type="button" class="btnSmallAct">삭제</button>
			</a>
		</td>
	</tr>
	<tr>
		<td>3</td>
		<td>유현선</td>
		<td>-1</td>
		<td>-1</td>
		<td>-1</td>
		<td>-1</td>
		<td>-1</td>
		<td>3</td>
		<td>
			<a href="">
				<button type="button" class="btnSmallAct">입력</button>
			</a>
			<a href="">
				<button type="button" class="btnSmallNon" disabled="disabled">수정</button>
			</a>
			<a href="">
				<button type="button" class="btnSmallNon" disabled="disabled">삭제</button>
			</a>
		</td>
	</tr>
</table>  -->
</div>
</body>
</html>