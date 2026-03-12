<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	// ○ 방문자 수에 대한 처리
	// 1. application(→ 공유 저장소)에서 visitCount(방문자 수) 가져오기
	Integer count = (Integer)application.getAttribute("visitCount");
	
	// 2. 처음 접속자가 발생한 상황이라면 
	if(count == null)
		count = 0;
		//-- 초기화
	
	// 3. 방문자수 1만큼 증가
	//	  → 동기화 처리를 추가하는 것이 가능(정확도 향상)
	count++;
	
	// 4. 다시 application(→ 공유 저장소)에 저장
	//	  → 기존 값이 존재할 경우 덮어쓰기로 처리되는 개념
	application.setAttribute("visitCount", count);
	
	
	// ○ 접속자에 대한 확인
	//	  → 이클립스 내장 콘솔창에서 확인
	application.log("접속자: "+ request.getRemoteAddr());
	// 0:0:0:0:0:0:0:1 서버 pc에서 접속한 주소
	
	
	// ○ 웹 서버의 실제 물리적인 경로 확인
	String realPath = application.getRealPath("/");
	//-- C:\WebStudy\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\WebApp16\
	
	
	
	
	
	
	
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestCounter.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css" />
<style type="text/css">
	.small{font-size: small;}
</style>
</head>
<body>
<div>
	<h1>서버 통계</h1>
	<hr />
</div>

<div>
	<!-- <h2>우리 사이트 총 방문 횟수 : 10회</h2> -->
	<h2>우리 사이트 총 방문 횟수 : <%=count %>회</h2>
	<p><span class="small">(※ 이 숫자는 모든 브라우저에서 동일하게 증가한다.)</span></p>
	<br />
	<h2>웹 서버 실제 경로: <%= realPath %></h2>
</div>
</body>
</html>