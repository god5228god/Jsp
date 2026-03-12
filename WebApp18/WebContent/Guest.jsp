<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Guest.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css" />
<style type="text/css">
body{background-color: #eee;}
.formWrap
{
	width: 300px; height: 200px; 
	background-color: #fff; 
	padding: 10px; box-sizing: border-box; 
	margin: auto;
	border-radius: 10px;
	box-shadow: 2px 10px 100px rgba(0,0,0,0.1);
	margin-top: 30px;
}
.wrap{position: relative; width: 300px; margin-bottom: 5px;}
.wrap label {float: left; width: 80px;}
textarea
{
	width: 223px; height: 50px;
	border: none;
	padding: 5px 2px; box-sizing:border-box;
	background-color: #eee;
}
.inTxt
{
	width: 150px; height: 25px;
	padding-left: 5px; box-sizing: border-box;
	border: none; border-radius: 10px;
	background-color: #eee;
}
.inTxt:focus 
{
	border: 2px solid #fff426;	
	background-color: #f5f3e1;
	
}
.btn
{
	width: 230px; height: 35px;
	font-size: 14px;
	border: none; border-radius: 5px;
	background-color: #222; color: #fff; 
}
.btn:hover
{
	background-color: #ddd;	 color: #222;
}
label{line-height: 25px;}

</style>
</head>
<body>
<div>
	<h1>간단한 기본 방명록 작성 실습</h1>
	<p>JSP 액션 태그 활용</p>
	<hr />
</div>

<!-- 
	○ 물리적 파일 구성
	- Guest.jsp 작성자, 제목, 내용 → 사용자로부터 입력
	- com.test.GuestBean		   → Java Bean 활용
	- Guest_ok.jsp				   → 데이터 수신 → 객체 생성 → 결과 화면 구성
	 -->
	 
<div class="formWrap">
	<form action="Guest_ok.jsp" method="post" name="myForm">
		<div class="wrap">
			<label >작성자</label>
			<input type="text" name="writer" class="inTxt" />
		</div>
		<div class="wrap">
			<label>제목</label>
			<input type="text" name="title" class="inTxt" />
		</div>
		<div class="wrap">
			<label class="wrap">내용</label>
			<textarea name="contents" placeholder="내용 입력"></textarea>
		</div>
		
		<div>		
			<button type="submit" class="btn">작성</button>
		</div>
	</form>
</div>
</body>
</html>