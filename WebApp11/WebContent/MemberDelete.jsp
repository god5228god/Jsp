<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	
	//-- 이전 페이지(MemberList.jsp)로부터 넘어온 데이터 수신
	//-- sid
	String sid = request.getParameter("sid");
	
	MemberDAO dao = new MemberDAO();
	//boolean isDeleted = false;
	int count = -1;

	// 사용자에게 다시 요청할 수 있도록 안내하는 주소 문자열 구성
	String strAddr = "";
	
	try
	{
		// 데이터베이스 연결
		dao.connection();
		
		// 참조 레코드 수 확인
		count = dao.refCount(sid);
		//-- TBL_MEMBER(→ 부모) 테이블의 제거하고자하는 데이터의
		//	 SID를 참조하는 TBL_MEMBERSCORE(→ 자식)테이블 내의 데이터 갯수 확인
		
		if(count==0)	//-- 제거 가능
		{
			dao.remove(sid);
			//isDeleted = true;
			strAddr = "MemberList.jsp";
		}
		else			//-- 제거 불가
		{
			// TBL_MEMBERSCORE 테이블의 데이터가 TBL_MEMBER 테이블의 데이터를
			// 참조하고 있는 경우로 삭제가 불가능한 상황
			// → 제거하지 못하는 사유를 안내할 수 있는 페지이로 이동
			//	  + 리스트로 돌아갈 수 있는 방법 제공
			strAddr = "Notice.jsp";
		}
		
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			dao.close();
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
	}
	// Check!
	response.sendRedirect(strAddr);
	//-- 클라이언트가 새로 요청할 페이지를 상황에 따라 다른 페이지로 안내


%>

<!-- 내가 해본 방법
<script type="text/javascript">
	<%-- <% if(count > 0){%> --%>
		alert("참조된 데이터가 있어서 삭제할 수 없습니다.");
		location.href = "MemberList.jsp";
<%-- 	<%} else if(isDeleted){ %> --%>
		alert("삭제 완료되었습니다");
		location.href="MemberList.jsp"
	<%-- <%} %> --%>
</script>
-->