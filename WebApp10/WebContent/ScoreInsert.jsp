<%@page import="com.test.ScoreDTO"%>
<%@page import="com.test.ScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("userName");
	String korStr = request.getParameter("kor");
	String engStr = request.getParameter("eng");
	String matStr = request.getParameter("mat");
	
	ScoreDAO dao = null;
	
	try{
	
		int kor = Integer.parseInt(korStr);
		int eng = Integer.parseInt(engStr);
		int mat = Integer.parseInt(matStr);
		
		dao = new ScoreDAO();
		
		ScoreDTO score = new ScoreDTO();
		score.setName(name);
		score.setKor(kor);
		score.setEng(eng);
		score.setMat(mat);
		
		int result = dao.add(score);
		
		if(result>0){
			response.sendRedirect("ScoreList.jsp");
		}
		
		
	}catch(Exception e){
		System.out.print(e.toString());
	}
	finally{
		try{
			dao.close();
		}catch(Exception e){
			System.out.print(e.toString());
		}
	}
%>