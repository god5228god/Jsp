<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.util.DBConn"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지(Test002.jsp)로부터 넘어온 데이터 수신
	//-- userName, userTel
	
	// 한글 데이터 깨짐 방지 처리
	request.setCharacterEncoding("UTF-8");
	
	String userName = request.getParameter("userName");
	String userTel = request.getParameter("userTel");
	
	// ※ 수신한 데이터를 활용하여 데이터베이스 액션 처리
	
	// 데이터베이스 연결
	Connection conn = DBConn.getConnection();
	
	// 쿼리문 준비 → insert
	String sql = String.format("INSERT INTO TBL_MEMBER(SID, NAME, TEL)"
	+" VALUES(MEMBERSEQ.NEXTVAL, '%s','%s')",userName, userTel);
	
	// 작업 객체 생성 및 쿼리문 실행
	Statement stmt = conn.createStatement();
	
	int result = stmt.executeUpdate(sql);
	//-- 적용된 행의 갯수 반환
	
	stmt.close();
	DBConn.close();
	
	if(result<1)	//-- 적용된 행의 갯수가 1 미만
	{
		// 에러 페이지를 다시 요청할 수 있도록 안내
		response.sendRedirect("ErrorPage.jsp");
		//-- 처리 과정에서 문제가 발생했으니
		//   이와 관련된 흐름 페이지를 다시 요청해서 찾아갈 수 있도록 안내
	}
	else			//-- 적용된 행의 갯수가 1 미만이 아님
	{
		// Type A. 현재 페이지에서 정상 입력 안내
		// Type B. 리스트 페이지를 다시 요청할 수 있도록 안내
		response.sendRedirect("Test002.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberInsert.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css" />
<style type="text/css">
a{text-decoration: none; color: blue; font-weight: bold;}
</style>
</head>
<body>
<div>
	<h1>데이터베이스 연결 및 데이터 처리</h1>
	<hr />
</div>
<div>
	<h2>데이터 추가 완료</h2>
</div>
<div>
	<a href="Test002.jsp">리스트 페이지로 돌아가기</a>
</div>
</body>
</html>






















