<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%

	// 데이터베이스 연결
	Connection conn = DBConn.getConnection();
	
	// 쿼리문 준비
	String sql = "SELECT SID, NAME, KOR, ENG, MAT ,(KOR+ENG+MAT) AS TOT,(KOR+ENG+MAT)/3 AS AVG FROM TBL_SCORE ORDER BY SID";
	
	// 작업 객체 생성
	Statement stmt = conn.createStatement();
	
	// 쿼리문 실행
	ResultSet rs = stmt.executeQuery(sql);
	
	String str = "";
	
	str += " 	<table class='table'>";
	str += " 		<tr>";
	str += " 			<th>번호</th>";
	str += " 			<th>이름</th>";
	str += " 			<th>국어점수</th>";
	str += " 			<th>영어점수</th>";
	str += " 			<th>수학점수</th>";
	str += " 			<th>총점</th>";
	str += " 			<th>평균</th>";
	str += " 		</tr>";
	
	while(rs.next()){

		str += " 		<tr>";
		str += " 			<td>"+ rs.getString("SID") +"</td>";
		str += " 			<td>"+ rs.getString("NAME") +"</td>";
		str += " 			<td>"+ rs.getString("KOR") +"</td>";
		str += " 			<td>"+ rs.getString("ENG") +"</td>";
		str += " 			<td>"+ rs.getString("MAT") +"</td>";
		str += " 			<td>"+ rs.getString("TOT") +"</td>";
		str += " 			<td>"+ rs.getString("AVG") +"</td>";
		str += " 		</tr>";
		
	}
	
	str += " 	</table>";
	
	rs.close();
	stmt.close();
	DBConn.close();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ScoreList.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css" />
<style type="text/css">
.errMsg{font-size: small; color: red; display: none;}
.btn{width: 200px; height: 35px; font-size: 16px;margin: 10px 0;}
.txt{width: 100px; text-align: center;}
.table tr>*{text-align: center;}
</style>
<script type="text/javascript">

	function formCheck()
	{
		//alert("확인");
		let name = document.getElementById("userName");
		let kor = document.getElementById("kor");
		let eng = document.getElementById("eng");
		let mat = document.getElementById("mat");
		let nameMsg = document.getElementById("nameMsg");
		let korMsg = document.getElementById("korMsg");
		let engMsg = document.getElementById("engMsg");
		let matMsg = document.getElementById("matMsg");
		
		let nKor = Number(kor.value);
		let nEng = Number(eng.value);
		let nMat = Number(mat.value);
		
		nameMsg.style.display = "none";
		korMsg.style.display = "none";
		engMsg.style.display = "none";
		matMsg.style.display = "none";
		
		let flag = true;
		let isFocused = false;
		
		 if(name.value == ""){
			nameMsg.style.display="inline";
			if(!isFocused){				
				name.focus();
				isFocused = true;
			}
			flag = false;
		}
		
		 
		if(nKor<0 || nKor>100){
			korMsg.style.display ="inline";
			if(!isFocused){				
				kor.focus();
				isFocused = true;
			}
			flag = false;
		}
		if(nEng<0 || nEng>100){
			engMsg.style.display ="inline";
			if(!isFocused){				
				eng.focus();
				isFocused = true;
			}
			flag = false;
		}
		
		if(nMat<0 || nMat>100){
			matMsg.style.display ="inline";
			if(!isFocused){				
				mat.focus();
				isFocused = true;
			}
			flag = false;
		} 
	
		if(!flag)
			return false;
		
		return true;

	}

</script>
</head>
<body>
<!-- 
	○ WebApp08
	
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
	
	번호 	이름	 국어점수 영어점수 수학점수 총점	 평균
	1		양호열		90		80		70		240		80
	2		유현선		80		70		60		210		70
	3		윤주열		70		60		50		180		60
	4		이수빈		50		40		30		120		40
	
	--------------------------------------------------------
	- 물리적 파일 구성
	·WebApp08_scott.sql
	·ScoreList.jsp
	·com.util.DBConn
	
	
 -->
 <div>
 	<form action="ScoreInsert.jsp" method="post" onsubmit="return formCheck()">
 		<h2>성적 입력</h2>
 		<table>
 			<tr>
 				<th>이름(*)</th>
 				<td>
 					<input type="text" id="userName" name="userName" class="txt" />
 					<span class="errMsg" id="nameMsg">이름을 입력해주세요.</span>
 				</td>
 			</tr>
 			<tr>
 				<th>국어점수</th>
 				<td>
 					<input type="text" id="kor" name="kor" class="txt" />
 					<span class="errMsg" id="korMsg">0 ~ 100 사이의 정수를 입력해주세요.</span>
 				</td>
 			</tr>
 			<tr>
 				<th>영어점수</th>
 				<td>
 					<input type="text" id="eng" name="eng" class="txt" />
 					<span class="errMsg" id="engMsg">0 ~ 100 사이의 정수를 입력해주세요.</span>
 				</td>
 			</tr>
 			<tr>
 				<th>수학점수</th>
 				<td>
 					<input type="text" id="mat" name="mat" class="txt" />
 					<span class="errMsg" id="matMsg">0 ~ 100 사이의 정수를 입력해주세요.</span>
 				</td>
 			</tr>
 			<tr>
 				<th></th>
 				<td><button type="submit" class="btn" >성적 데이터 추가</button></td>
 			</tr>
 		</table>
 	</form>
 </div>
 <div>
<!--  	<table class="table">
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
 	<%= str %>
 </div>
</body>
</html>