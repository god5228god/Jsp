<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css" />
<link rel="stylesheet" type="text/css" href="css/custom.css" />
</head>
<body>
<div>
	<div>
		<h1>include 액션 태그 활용 실습</h1>
		<hr />
	</div>
	<div>
		<table style="width: 800px;"border="1">
			<tr>
				<td colspan="2">
					<!-- Top -->
					<%-- <jsp:include page="Top.jsp"></jsp:include> --%>
					<jsp:include page="Top.jsp">
						<jsp:param value="상단 메뉴" name="title"/>
					</jsp:include>
				</td>
			</tr>
			<tr style="height: 500px">
				<td style="width: 200px">
					<!-- Left -->
					<jsp:include page="Left.jsp"></jsp:include>
				</td>
				<td>
					Main(메인 화면 구성)
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<!-- Bottom -->
					<jsp:include page="Bottom.jsp"></jsp:include>
				</td>
			</tr>
		</table>
	</div>
</div>
</body>
</html>