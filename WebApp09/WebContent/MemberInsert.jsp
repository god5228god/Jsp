<%@page import="com.test.MemberDAO"%>
<%@page import="com.test.MemberDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// MemberInsert.jsp
	//-- 데이터 입력 액션 처리 전용 페이지
	
	// ※ 흐름
	// 한글 깨짐 방지 처리(인코딩 환경 설정) → 데이터 수신
	// → MemberDAO 객체 생성 → MemberDAO 객체의 add() 메소드 호출
	// (→ insert 쿼리문 수행) → 사용자에게 MemberList.jsp 페이지를 다시 요청할 수 있도록 안내 
	
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("userName");
	String tel = request.getParameter("userTel");
	
	MemberDAO dao = null;
	
	try
	{
		dao = new MemberDAO();
		
		//MemberDTO 구성
		MemberDTO member  = new MemberDTO();
		member.setName(name);
		member.setTel(tel);
		
		// dao의 add() 메소드 호출 → insert 쿼리문 수행
		dao.add(member);
		
		// 필요하다면 add() 메소드의 반환 값을 넘겨받아
		// insert 액션의 정상 처리 여부 확인 후 추가 코드 구성 간으
		
	}catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try{
			dao.close();
			
		}catch(Exception e){
			System.out.println(e.toString());
		}
	}
	
	// 사용자에게 MemeberList.jsp 페이지를 다시 요청할 수 있도록 안내
	response.sendRedirect("MemberList.jsp");
	
/* 	// DTO 객체에 set해주기
	MemberDTO dto = new MemberDTO();
	dto.setName(name);
	dto.setTel(tel);
	
	// DAO를 통해서 DB에 저장
	MemberDAO dao = new MemberDAO();
	int result = dao.add(dto);
	
	if(result>0){
		response.sendRedirect("MemberList.jsp");
	} */
	
%>
