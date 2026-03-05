<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send15.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css" />
<style type="text/css">
.txt{width: 50px; }
select{margin: 15px 0; text-align: center; width: 50px;}
.btn{width: 100px; height: 30px; margin-top: 10px;}
</style>
</head>
<body>
<div>
	<h1>데이터 송수신 실습 15</h1>
	<hr />
</div>
<!-- ■■■ 포워드 / 리다이렉트 관련 중요 실습 ■■■  -->

<!--  ① 사용자 최초 요청 페이지 구성  -->
<!-- 	- 사칙연산 수행을 위한 정수 입력 페이지 구성	  -->
<!--  	- 연산자를 함께 입력 받을 수 있도록 처리-->
<!--  	- 정수1 / 정수2 / 연산자 -->
<!--  	- http://localhost:3306/WebApp06/Send15.jsp -->

<!--  ② 연산 전용 페이지 구성 -->
<!--  	- 스크립릿 코드만 존재 + jsp:forward 액션 태그 추가 -->
<!--  	  → 추후 우리는 이 코드를 JAVA로 분리하여 → Servlet으로 구성할 예정 -->
<!--  	- http://localhost:3306/WebApp06/Forward15.jsp -->

<!--  ③ 최종 결과 출력 페이지 구성 -->
<!--  	- 연산 전용 페이지에서 처리한 결과를 넘겨받아 클라이언트와 대면할 페이지로 구성 -->
<!--  	  → 추후 우리는 이 페이지를 JSP View 페이지 역할을 수행하도록 구성할 예정 --->
<!--  	- http://localhost:3306/WebApp06/Receive15.jsp  -->
<div>
	<!-- <form action="Forward15.jsp" method="post"> -->
	<form action="" method="post">
		정수1 <input type="text" name="num1" class="txt" />
		<br>
		연산자
		<select name="op">
			<option value="+">+</option>
			<option value="-">-</option>
			<option value="*">*</option>
			<option value="/">/</option>
		</select>
		<!-- 연산자 <input type="text" name="op" class="txt" /> -->
		<br>
		정수2 <input type="text" name="num2" class="txt" />
		<br>
		<button type="submit" class="btn" onclick="this.form.action='Forward15_1.jsp'" >전송</button>
	</form>
</div>

</body>
</html>