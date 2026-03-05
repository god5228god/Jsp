<%@ page contentType="text/html; charset=UTF-8"%>
<%

	String num1Str = request.getParameter("num1");
	String num2Str = request.getParameter("num2");
	String op = request.getParameter("op");
	
	int num1 = 0;
	int num2 = 0;
	String result = "";
	
	try
	{
		num1 = Integer.parseInt(num1Str);
		num2 = Integer.parseInt(num2Str);
		
		if(op.equals("1")){
			result = String.format("%d", (num1+num2));
		}else if(op.equals("2")){
			result = String.format("%d", num1-num2);
		}else if(op.equals("3")){
			result = String.format("%d",(num1*num2));
		}else if(op.equals("4")){
			result = String.format("%.1f",(num1/(double)num2));
		}
		
		// check!
		//response.sendRedirect("Receive16.jsp");
		//-- 클라이언트에게 Receive16.jsp 페이지를 다시 요청할 수 있도록 안내
		
		// ※ response 객체의 주요 메소드 중 하나인
		// 	  sendRedirect(String location)
		//	  : 지정된 URL(location)로 요청을 다시 전송한다.
		
		response.sendRedirect("Receive16.jsp?num1="+num1+"&num2="+num2+"&op="+op+"&str="+result);
	

	}catch(Exception e)
	{
		System.out.println(e.toString());
	}

	

%>

<%-- num1: <%= num1%>, num2: <%= num2%>, op: <%= op%> --%>