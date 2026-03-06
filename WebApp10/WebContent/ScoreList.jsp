<%@page import="com.test.ScoreDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.test.ScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	ScoreDAO dao = new ScoreDAO();

	ArrayList<ScoreDTO> list = dao.list();
	
	int count =  dao.count();
	
	// 문자열 결합
		StringBuilder sb = new StringBuilder();
	sb.append("<table class='table'>");
	sb.append(" 			<tr>");
	sb.append(" 				<th>번호</th>");
	sb.append(" 				<th>이름</th>");
	sb.append(" 				<th>국어점수</th>");
	sb.append(" 				<th>영어점수</th>");
	sb.append(" 				<th>수학점수</th>");
	sb.append(" 				<th>총점</th>");
	sb.append(" 				<th>평균</th>");
	sb.append(" 			</tr>");
	
	for(ScoreDTO score:list){
		
		sb.append(" 			<tr>");
		sb.append(" 				<td>"+ score.getSid() +"</td>");
		sb.append(" 				<td>"+ score.getName() +"</td>");
		sb.append(" 				<td>"+ score.getKor() +"</td>");
		sb.append(" 				<td>"+ score.getEng() +"</td>");
		sb.append(" 				<td>"+ score.getMat() +"</td>");
		sb.append(" 				<td>"+ score.getTot() +"</td>");
		sb.append(" 				<td>"+ score.getAvg() +"</td>");
		sb.append(" 			</tr>");
		
	}
	
	
	
	sb.append(" 		</table> ");

	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ScoreList.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css" />
<style type="text/css">
	.errMsg{font-size: small; color: red; display: none;}
	.txt{width: 80px; margin-left: 5px; padding-left: 5px;}
	.btn{width: 185px; height: 35px;}
	td{text-align: center;}
</style>
<script type="text/javascript">
	function formCheck()
	{
		let name = document.getElementById("userName");
		let nameMsg = document.getElementById("nameMsg");
		let kor = document.getElementById("kor");
		let eng = document.getElementById("eng");
		let mat = document.getElementById("mat");
		let korMsg = document.getElementById("korMsg");
		let engMsg = document.getElementById("engMsg");
		let matMsg = document.getElementById("matMsg");
		
		nameMsg.style.display = "none";
		korMsg.style.display = "none";
		engMsg.style.display = "none";
		matMsg.style.display = "none";
		
		let isValid = true;
		let isFocused = false;
	
		
		if(name.value==""){
			nameMsg.style.display = "inline";
			if(!isFocused){				
				name.focus();
				isFocused = true;
			}
			isValid = false;
		}
		
		if(Number(kor.value)>100 || Number(kor.value)<0){
			korMsg.style.display = "inline";
			if(!isFocused){				
				kor.focus();
				isFocused = true;
			}
			isValid = false;
		}
		if(Number(eng.value)>100 || Number(eng.value)<0){
			engMsg.style.display = "inline";
			if(!isFocused){				
				eng.focus();
				isFocused = true;
			}
			isValid = false;
		}
		if(Number(mat.value)>100 || Number(mat.value)<0){
			matMsg.style.display = "inline";
			if(!isFocused){				
				mat.focus();
				isFocused = true;
			}
			isValid = false;
		}
		
		if(!isValid)
			return false;
		
		return true;
	}
</script>
</head>
<body>
<!-- 
	○ WebApp10
	
	- 여러 명의 이름, 국어점수, 영어점수, 수학점수를 입력받아
	총점과 평균을 포함하여 리스트를 출력하는 프로그램을 구현한다.
	- 리스트 출력 시 번호 오름차순으로 정렬하여 처리할 수 있도록 한다.
	- 데이터베이스 연동하여 처리한다.
		(TBL_SCORE, SCORESEQ활용)
	- 즉, 성적 처리 프로그램을 데이터베이스 연동하여
	JSP로 구성할 수 있도록 한다.
	
	데이터베이스 연결 및 데이터 처리
	--------------------------------------------------------
	
	성적 처리
	
	이름(*)		[textbox]	→ 이름 입력 확인
	국어점수	[textbox]	→ 0 ~ 100 사이의 정수 형태의 데이터가 입력되었는지 확인
	영어점수	[textbox]	→ 0 ~ 100 사이의 정수 형태의 데이터가 입력되었는지 확인
	수학점수	[textbox]	→ 0 ~ 100 사이의 정수 형태의 데이터가 입력되었는지 확인
	
	<성적 데이터 추가>    	→ button
	
	전체 인원 수: 4명
	
	번호 	이름	 국어점수 영어점수 수학점수 총점	 평균
	1		양호열		90		80		70		240		80.x
	2		유현선		80		70		60		210		70.x
	3		윤주열		70		60		50		180		60.x
	4		이수빈		50		40		30		120		40.x
	
	--------------------------------------------------------
	- 물리적 파일 구성
	·WebApp10_scott.sql
	·com.test.ScoreDTO
	·com.test.ScoreDAO
	·ScoreList.jsp
	·ScoreInsert.jsp
	·com.util.DBConn
	
	
 -->
 
 <div>
 	<h1>성적처리</h1>
 	<hr />
 </div>
 <div>
 <form action="ScoreInsert.jsp" method="post" onsubmit="return formCheck()">
 	<table>
 		<tr>
 			<th>이름(*)</th>
 			<td>
 				<input type="text" id="userName" name="userName" class="txt"/>
 				<span class="errMsg" id="nameMsg">이름을 입력해주세요.</span>
 			</td>
 		</tr>
 		<tr>
 			<th>국어점수</th>
 			<td>
 				<input type="text" id="kor" name="kor" class="txt"/>
 				<span class="errMsg" id="korMsg">0 ~ 100 사이의 정수를 입력해주세요.</span>
 			</td>
 		</tr>
 		 		<tr>
 			<th>영어점수</th>
 			<td>
 				<input type="text" id="eng" name="eng" class="txt"/>
 				<span class="errMsg" id="engMsg">0 ~ 100 사이의 정수를 입력해주세요.</span>
 			</td>
 		</tr>
 		 		<tr>
 			<th>수학점수</th>
 			<td>
 				<input type="text" id="mat" name="mat" class="txt"/>
 				<span class="errMsg" id="matMsg">0 ~ 100 사이의 정수를 입력해주세요.</span>
 			</td>
 		</tr>
 		<tr>
 			<td colspan="2">
 				<button type="submit" class="btn control"> 성적 데이터 추가</button>
 			</td>
 		</tr>
 	</table>
 	<br><br>
 	<div>
 		<p>전체 인원수: <%= count %>명</p>
 		<%= sb.toString() %>
<!--  		<table class="table">
 			<tr>
 				<th>번호</th>
 				<th>이름</th>
 				<th>국어점수</th>
 				<th>영어점수</th>
 				<th>수학점수</th>
 				<th>총점</th>
 				<th>평균</th>
 			</tr>
 			<tr>
 				<td>1</td>
 				<td>홍길동</td>
 				<td>90</td>
 				<td>80</td>
 				<td>70</td>
 				<td>240</td>
 				<td>80</td>
 			</tr>
 		</table> -->
 	</div>
 </form>
 </div>
</body>
</html>