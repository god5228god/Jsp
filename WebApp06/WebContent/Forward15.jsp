<%@ page contentType="text/html; charset=UTF-8"%>
<%
	
	//이전 페이지(Send15.jsp)로부터 넘어온 데이터 수신	
	//-- num1, num2, op
	
	String num1Str = request.getParameter("num1");
	String num2Str = request.getParameter("num2");
	String op = request.getParameter("op");
	
	String result = "";
	int num1 = 0;
	int num2 = 0;
	
	try
	{
		num1 = Integer.parseInt(num1Str);
		num2 = Integer.parseInt(num2Str);

		if(op.equals("+")){
			result = String.format("%d %s %d = %d ", num1, op, num2, num1+num2);
		}else if(op.equals("-")){
			result = String.format("%d %s %d = %d ", num1, op, num2, num1-num2);	
		}else if(op.equals("*")){
			result = String.format("%d %s %d = %d ", num1, op, num2, num1*num2);	
		}else if(op.equals("/")){
			result = String.format("%d %s %d = %d ", num1, op, num2, num1/num2);	
		} 
		
		
	}catch(Exception e)
	{
		System.out.println(e.toString());
	}

	request.setAttribute("resultStr", result);
%>

<jsp:forward page="Receive15.jsp"></jsp:forward>

