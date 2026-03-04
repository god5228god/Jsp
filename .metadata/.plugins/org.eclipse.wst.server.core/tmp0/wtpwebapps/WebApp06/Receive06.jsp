<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지(Send06.jsp)로부터 넘어온 데이터 수신
	
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	String memo = request.getParameter("memo");
	
	// 이상형 데이터 수신
	// String idealType = reqest.getParameter("checkGroup") (x)
	// ※ 같은 name 속성의 값을 가진 데이터 여러 개를 받는(수신하는) 경우
	// 	  (즉, 다중 데이터로 수신하는 경우)
	// 	  이를 배열로 처리해야 한다. → getParameterValues()
	String[] idealTypes = request.getParameterValues("checkGroup");
	// ※ 배열 데이터를 수신하여 처리할 경우
	//	  수신된 데이터가 전혀 없는 경우는
	//	  배열의 값 자체가 null이 되어버리기 때문에
	//	  null에 대한 확인(검사) 과정이 필요하다. 	Check!
	
	String idealType ="";
	
	if(memo!= null)
	{
		//memo = memo.replace("\n","<br>");
		memo = memo.replaceAll("\r\n", "<br>");
		//-- JDK 1.5 이후부터 replaceAll() 메소드 사용 가능
		//	replaceAll()을 통해 처리한 결과를 다시 memo 변수에 대입
		// 안녕하세요.\n 반갑습니다.
		// → 안녕하세요.<br>반갑습니다.
	}
	
	if(idealTypes !=null){
		for(String item:idealTypes)
		{
			idealType += "[" + item + "] ";
		}
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive06.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css" />
</head>
<body>
<div>
	<h1>JSP를 이용한 데이터 송수신 실습 05</h1>
	<p>Send06.jsp○ → Receive06.jsp●</p>
	<hr />
</div>
<div>
	<h2>수신 데이터 확인</h2>
	<h3>이름: <%= name %></h3>
	<h3>메모</h3>
	<!-- <p>나는<br>오타도 줄어들고 있고<br>점점 타이핑도 빨라지고 있다.</p> -->
	<p><%= memo %></p>
	<h3>이상형</h3>
	<p><%= idealType %></p>	
</div>

</body>
</html>