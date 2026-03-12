<%@page import="com.test.Calculator"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	/*

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
	}*/

%>
<%
/* 	String strSu1 = request.getParameter("su1");
	String strSu2 = request.getParameter("su2");
	String op = request.getParameter("op");
	int su1 = Integer.parseInt(strSu1);
	int su2 = Integer.parseInt(strSu2); */
	
%>

<!-- ※ Calculator 클래스의 객체를 현재 페이지에서 사용할 수 있도록 지정 -->
<jsp:useBean id="ob" class="com.test.Calculator"></jsp:useBean>
<!-- → 이 구문은 스크립릿 영역에서 
		com.test.Calculator ob = new com.test.alculator();
		구문을 작성하여 import 구문을 자동으로 처리한 것과
		마찬가지 효과를 발생시키게(적용하게)된다.	 -->

<!-- ※ request.getParameter() 메소드를 통해 넘겨받은(전달받은) 데이터로
	Calculator 클래스를 기반으로 만들어진 op 객체에 넘겨주기 위한 속성 지정
 -->
<%-- <jsp:setProperty property="su1" name="ob" value="<%=su1 %>"/> --%>
<!-- → 이 구문은 스크립릿 영역에서
	ob.setSu1(su1);
	구문을 작성한 것과 같은 효과를 적용하게 된다.
 -->
<%-- <jsp:setProperty property="su2" name="ob" value="<%=su2 %>"/> --%>
<%-- <jsp:setProperty property="op" name="ob" value="<%= op %>"/> --%>


<!-- Check!  -->
<!-- 
	※ 객체의 속성명과 동일한 파라미터인 경우
	request.getParameter() 메소드 없이 바로 받을 수 있으며
	value 속성을 통해 넘겨주지 않아도 데이터 바인딩이 가능하다.
 -->
<jsp:setProperty property="su1" name="ob"/>
<jsp:setProperty property="su2" name="ob"/>
<jsp:setProperty property="op" name="ob"/>
<!-- → ① request.getParameter() 처리
		→ 매개변수를 전달하기 위한 데이터 수신 처리 -->
<!--	② Integer.parseInt() 처리
		→ 매개변수를 전달하기 위한 형(type) 변환 처리 -->
<!--    ③ ob.su1 → ob.setSu1() 호출 처리 -->
<!--    ③ ob.su2 → ob.setSu2() 호출 처리 -->
<!--    ③ ob.op  → ob.setOp() 호출 처리 -->
<!-- 	=>  최종적으로 ob → Calculator 기반의 ob 객체의 각각의 속성에
			이전 페이지로부터 넘겨받은 데이터를 적절한 타입(형)으로 변환하여 전달	 -->




<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calculator_ok2.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css" />
</head>
<body>
	<div>
		<h1>두 번째 방법 처리 결과</h1>
		<p>Calculator_ok2.jsp</p>
		<hr />
	</div>
	<div>
		<!-- <h2>결과 출력</h2> -->
		<%-- <h2><%=str %></h2> --%>
		<h2><%=ob.result() %></h2>
	</div>
</body>
</html>