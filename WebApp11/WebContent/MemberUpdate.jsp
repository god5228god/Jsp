<%@page import="com.test.MemberDTO"%>
<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//MemberInsert.jsp
	
	// 인코딩 설정
	request.setCharacterEncoding("UTF-8");

	//-- 이전 페이지(MemberUpdateForm.jsp)로부터 넘어온 데이터 수신
	//-- sid, uName, uTel
	String sid = request.getParameter("sid");
	String name = request.getParameter("uName");
	String tel = request.getParameter("uTel");
	
	// MemberDAO 객체 생성
	MemberDAO dao = new MemberDAO();
	
	try
	{
		// 데이터베이스 연결
		dao.connection();
		
		// MemberDTO 객체 생성 및 속성 구성
		MemberDTO member = new MemberDTO();
		
		member.setSid(sid);
		member.setName(name);
		member.setTel(tel);
		
		dao.modify(member);
	
		//※ 이후 반환 결과에 따른 분기 처리 가능
		
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			// 데이터베이스 연결 종료
			dao.close();
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
	}
	// 클라이언트가 MemberList.jsp 페이지를 다시 요청할 수 있도록 안내
	response.sendRedirect("MemberList.jsp");

%>
