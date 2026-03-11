<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 최초 요청일 경우 아무것도 없겠지만
	// TestSession01ok.jsp 페이지에서
	// 로그인 성공 과정을 거쳐 이후에 요청된 페이지라면
	// session의 userId에는 superman이
	// session의 userName에는 양호열이 담겨있는 상황
	
	String userId = (String)session.getAttribute("userId");		//"superman" - 다운캐스팅
	String userName = (String)session.getAttribute("userName"); //"양호열" - 다운캐스팅
	//-- session.getAttribute("userId")는
	// 	 Object 타입을 반환하므로
	//   String 타입으로 변환하는 과정 필요(다운 캐스팅)
	
	// ⓐ 최초 요청 상황
	//	   userId: null / userName: null
	// ⓑ 로그인 성공 이후 안내에 의해 페이지 재용청이 이루어진 상황
	//	   userId: "superman" / userName: "양호열"
	
	// 추가
	// 세션 시간 설정
	
	// ※ 별도의 시간 설정을 하지 않았을 경우
	//	   세션의 기본(default)시간은 1800초.
	session.setMaxInactiveInterval(10);
	//-- 세션이 유지되는 시간을 10초로 설정
	//	 이로 인해
	//	 로그인 후 10초 동안 아무 액션도 없는 상태에서
	//	 다시 페이지 새로고침을 수행하면 로그아웃 처리 확인 가능
	
	
	
	
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSession01.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css" /> -->
<link rel="stylesheet" type="text/css" href="css/MemberListScore.css" />
<style type="text/css">
	a{text-decoration: none;}
	.btnMenu
	{
		border: 1px solid gray;
		font-size: 8pt;
		width: 70px;
		height: 20px;
	}
</style>
<script type="text/javascript">

	function sendIt()
	{
		//alert("확인");
		
		// Check! name속성을 통한 접근
		let f = document.loginForm;
		
		if(!f.userId.value)
		{
			alert("아이디를 입력해주세요.");
			f.userId.focus();
			return;
		}
		
		if(!f.userPwd.value)
		{
			alert("비밀번호를 입력해주세요.");
			f.userPwd.focus();
			return;
		}
		
		f.submit();		
	}
</script>
</head>
<body>
<div>
	<h1>세션 처리</h1>
	<p>로그인</p>
	<hr />
</div>
<div>
	<table>
		<tr>
			<td>
			<!-- 
				<a href="">
					<button type="button" class="btnSmallAct btnMenu">게시판</button>
				</a>
				<a href="">
					<button type="button" class="btnSmallAct btnMenu">일정관리</button>
				</a>
				<a href="">
					<button type="button" class="btnSmallAct btnMenu">친구관리</button>
				</a>
				 -->
				<a href="">
					<button type="button" class="btnSmallAct btnMenu">게시판</button>
				</a>
				<%
					if(userId==null)	// 로그인 X
					{
				%>
				<button type="button" class="btnSmallNon btnMenu" disabled="disabled">일정관리</button>
				<button type="button" class="btnSmallNon btnMenu" disabled="disabled">친구관리</button>
				<%
					}else				// 로그인 ○
					{
				%>
				<a href="스케줄.jsp">
					<button type="button" class="btnSmallAct btnMenu">일정관리</button>
				</a>
				<a href="프랜드.jsp">
					<button type="button" class="btnSmallAct btnMenu">친구관리</button>
				</a>
				<%
					}
				%>
			</td>
		</tr>
	</table>
</div>
<br /><br />

<div>
	<table>
		<tr>
			<td>
			<%
				if(userId==null)	// 로그인 X
				{
			%>
				<form action="TestSession01ok.jsp" method="post" name="loginForm">
					<table>
						<tr>
							<th>아이디</th>
							<td>
								<input type="text" class="txt" name="userId" style="width: 150px;"/>
							</td>
						</tr>
						<tr>
							<th>패스워드</th>
							<td>
								<input type="text" class="txt" name="userPwd" style="width: 150px;"/>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<button type="button" class="btn" style="width: 100%;" onclick="sendIt()">로그인</button>
							</td>
						</tr>
					</table>
				</form>
				<%
				}
				else			// 로그인 ○
				{
				%>
					<h2><%=userName%>(<%=userId %>)님, 환영합니다.</h2>
					<h2>이제 일정관리와 친구관리 서비스를 이용할 수 있습니다.</h2>
				
					<p>
						<a href="TestSession02.jsp">
							<button type="button" class="btn">로그아웃</button>
						</a>
					</p>
				<%
				}%>
			</td>
		</tr>
	</table>
</div>
</body>
</html>