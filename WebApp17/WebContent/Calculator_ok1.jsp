<%@page import="com.test.Calculator"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	// 이전 페이지(Calculator.jsp)에서 넘어온 데이터 수신
	//-- su1, su2, op
	String strSu1 = request.getParameter("su1");
	String strSu2 = request.getParameter("su2");
	String op = request.getParameter("op");
	
	int su1, su2;
	su1 = su2 = 0;
	String str = "";
	
	if(strSu1==null||strSu2==null){
		// 이전 페이지(Calculator.jsp)를 다시 요청할 수 있도록 안내
		response.sendRedirect("Calculator.jsp");
	}else{
		su1 = Integer.parseInt(strSu1);
		su2 = Integer.parseInt(strSu2);
		
		// 자바에서 우리가 설계한 클래스를 사용하기 위해 → 객체 생성
		Calculator ob = new Calculator();
		//-- 이클립스 자동 완성 기능을 사용해여 구문을 작성할 경우
		//	 @page import="com.test.Calculator" 구문도 함께 생성되어 처리됨.
		//	 혹은, 자동완성 기능을 사용하지 않을 경우도
		//	 %@page import="com.test.Calculator" 구문을 우리가 직접 작성해서
		//	 해당 클래스를 사용할 수 있도록 처리해 주어야 함
		//	 또는
		//	 com.test.Calculator ob = new com.test.Calculator();와 같이
		//	 객체 생성 구문에 직접 함께 작성하는 것도 가능함.
		
		ob.setSu1(su1);
		ob.setSu2(su2);
		ob.setOp(op);
		
		str = ob.result();
		
		
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calculator_ok1.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css" />
</head>
<body>
	<div>
		<h1>첫 번째 방법 처리 결과</h1>
		<p>Calculator_ok1.jsp</p>
		<hr />
	</div>
	<div>
		<!-- <h2>결과 출력</h2> -->
		<h2><%=str %></h2>
	</div>
</body>
</html>