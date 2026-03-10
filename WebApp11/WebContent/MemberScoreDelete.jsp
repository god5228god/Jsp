<%@page import="com.test.MemberScoreDAO"%>
<%@page import="com.test.MemberScoreDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	
	String sid = request.getParameter("sid");

	MemberScoreDAO dao = new MemberScoreDAO();
	
	try
	{
		dao.connection();
		
		dao.remove(sid);
	}
	catch(Exception e)
	{
		System.out.print(e.toString());
	}
	finally
	{
		try
		{
			dao.close();	
		}
		catch(Exception e)
		{
			System.out.print(e.toString());
		}
	}
	
	response.sendRedirect("MemberScoreList.jsp");
%>
