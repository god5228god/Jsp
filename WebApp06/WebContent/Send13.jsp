<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지로부터 넘어온 데이터 수신 -- (x)
	String result = "";
	
	result += "<ul>";
	for(int i = 1;  i<=9; i++){
		//result += String.format("<li>%d단</li>", i);
		//result += String.format("<li><a>%d단</a></li>", i);
		//result += String.format("<li><a href='Receive13.jsp'>%d단</a></li>", i);
		result += String.format("<li><a href='Receive13.jsp?gugudan=%1$d'>%1$d단</a></li>", i);
	} 
	
	result+= "</ul>";

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send13.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css" />
<style type="text/css">
	ul{padding: 10px;}
	li{list-style: none; font-size: 18px; margin-bottom: 5px;}
	a{text-decoration: none; cursor: pointer;font-size: 18px;}
	a:hover{text-decoration: underline;}
	
</style>
</head>
<body>
<div>
	<h1>JSP를 이용한 데이터 송수신 실습 13</h1>
	<p>Send13.jsp● → Receive13.jsp○</p>
	<hr />
</div>
<!-- 
	○ 데이터 송수신 실습
	
		- a태그에 대한 반복문 처리를 수행하는 JSP 페이지를 구성한다.
		
		- 이를 활용하여 구구단 리스트를 동적으로 구성해
		  선택에 따른 결과 페이지를 요청하여 출력해주는 형태의 페이지로 구현한다.
		  
		- submit 버튼 없이 이벤트 처리를 할 수 있도록 한다.
		
		페이지 레이아웃
		-------------------------------------------------------
		
		구구단 선택
		
		1단		┐
		2단		
		 :         목록 구성
		8단
		9단     ┘
		
		
		
		-------------------------------------------------------
		
		- 리스트의 특정 항목(단)을 선택했을 때
		  해당 구구단을 출력해주는 형태의 페이지를 요청할 수 있도록 처리한다. 
		
		
		- 사용자 최초 요청 주소
	      http://localhost:3306/WebApp06/Send13.jsp
	      
	   - 물리적 파일 구성
	     ·Send13.jsp
	     ·Receive13.jsp
	
 -->
 <div>
<%--  	구구단 선택
 	<ul>
 		<%
			for(int i=1; i<=9; i++){
				out.print("<li><a href=Receive13.jsp?dan=" + i +" >"+i + "단 </a></li>");
			} 		
 		%>
 	</ul> --%>
 </div>
 <div>
 	<h2>구구단 선택</h2>
 	<div>
 		<%=result %>
 	</div>
 </div>
</body>
</html>