<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSession03.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css" />
<style type="text/css">
.txt{width: 150px;}
.btn{width: 100%; font-size: 16px; border:none; height: 30px; background-color: #a4bade; color: #fff; font-weight: bold;}
</style>
<script type="text/javascript">

	function testSubmit()
	{

 		let f = document.form03;
		
		if(!f.name.value){
			alert("이름을 입력해주세요.");
			f.name.focus();
			return;
		}
		if(!f.tel.value){
			alert("전화번호를 입력해주세요.");
			f.tel.focus();
			return;
		}
		
		f.submit(); 
	}
</script>
</head>
<body>

<!-- 
	○ TestSession03.jsp 에서 TestSession04.jsp로
		이름과 전화번호를 입력받아 전송
		
		TestSession04.jsp 에서 TestSession05.jsp로
		아이디와 패스워드를 입력받고 
		앞에서 전달받은 이름과 전화번호를 함께 전송
		
		TestSession05.jsp에서
		전달받은 이름, 전화번호, 아이디, 패스워드 출력
		
		03  ──────→  04  ──────→  05
		이름, 전화			아이디, 패스워드    이름, 전화, 아이디, 패스워드
		입력				입력				출력


	※ 즉, 03에서 04로 넘겨받을 때는 getParameter
	   04에서 05로 넘겨받을 때는 getParameter()와 getAttribute()로 세션 활용
	   03에서 05로 직접 넘겨줄 수 없기 때문에 세션(session)에 저장
	   
	   	 
 -->
<div>
	<form action="TestSession04.jsp" method="post" name="form03">
		<table>
			<tr>
				<th>이름</th>
				<td><input type="text" class="txt" name="name"/></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" class="txt" name="tel"/></td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="button" class="btn" onclick="testSubmit()">입력</button>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>