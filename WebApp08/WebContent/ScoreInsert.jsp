<%@page import="java.sql.Statement"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String name = request.getParameter("userName");
	String kor = request.getParameter("kor");
	String eng = request.getParameter("eng");
	String mat = request.getParameter("mat");
	
	// 데이터베이스 연결
	Connection conn = DBConn.getConnection();
	
	// 쿼리문 준비
	String sql = String.format( "INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT)"
	+" VALUES(SCORESEQ.NEXTVAL, '%s', %d, %d , %d)",name, Integer.parseInt(kor), Integer.parseInt(eng), Integer.parseInt(mat));
	
	// 작업객체 생성 및 쿼리문 실행
	Statement stmt = conn.createStatement();
	
	int result = stmt.executeUpdate(sql);
	
	stmt.close();
	DBConn.close();
	
	if(result<1){
		response.sendRedirect("ErrorPage.jsp");
	}else{
		response.sendRedirect("ScoreList.jsp");
	}
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/main.css" />
</head>
<body>
데이터베이스추가
</body>
</html>