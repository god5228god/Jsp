<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	final String ADMIN_PW = "admin12345";
	//-- 실제 환경에서는 DB나 설정파일에 둔다.
	
	// 2. 상태 파악(인증여부, 동작 모드 등)
	String act = request.getParameter("act");

	String pwd = request.getParameter("pwd");
	
	// 세션을 이용해 관리자 로그인 상태를 유지(매번 비번 치지 않도록)
	Boolean login = (Boolean) session.getAttribute("pwd");
	
	if(login==null)
		login = false;

	
	// 3. 로직 처리
	// 3-1. 로그인 시도시
	
	if(pwd!=null&&pwd.equals("admin1234")){
		session.setAttribute("pwd", true);
	}
	
	// 설정하기 클릭했는지 확인
	// form 데이터 수신
	// application객체에 전역 설정 세팅(저장)
	// 현재 설정값 읽어오기
	
	String action = request.getParameter("action");
	
	if(action!=null && action.equals("update"))
	{
		String mode = request.getParameter("mode");
		String msg = request.getParameter("msg");
		
		if(mode.equals("ON")){
			application.setAttribute("isMaintenance", true);
		}else{
			application.setAttribute("isMaintenance", false);
		}
		application.setAttribute("msg", msg);
		
		out.println("<script>alert('시스템 설정이 변경되었습니다.')</script>");
		
	}
	
		Boolean getMode = (Boolean)application.getAttribute("isMaintenance");
		String getMsg = (String)application.getAttribute("msg");
		
		if(getMode==null)
			getMode = false;
		
		if(getMsg==null)
			getMsg = "정상 가동 중입니다.";
		
	// 로그 아웃 클릭시
	String logout = request.getParameter("logout");
	
	if(logout!=null&&logout.equals("out")){
		login = false;
		session.invalidate();
		//session.removeAttribute()
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AdminSetting_1.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css" />
<style type="text/css">
	body
	{
		font-family: "맑은 고딕";
		background-color: #f0f2f5;
		padding: 50px;	
	}
	.admin-card
	{
		background: white;
		max-width: 500px;
		margin: auto;
		padding: 30px;
		border-radius: 12px;
		box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
		
	}
	.admin-login
	{
		background: white;
		max-width: 500px;
		margin: auto;
		padding: 30px;
		border-radius: 12px;
		box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
		
	}
	h2
	{
		border-bottom: 2px solid #3498db;
		padding-bottom: 10px;
		color: #2c3e50;
		
	}
	.status-badge
	{
		display: inline-block;
		padding: 5px 15px;
		border-radius: 20px;
		font-weight: bold;
		font-size: 14px;
		margin-bottom: 20px;
		
	}
	.on {background-color: #ff7675; color: #fff;} 		/* 점검 중 색상 */
	.off {background-color: #55efc4; color: #2d3436;} 	/* 정상 운영 색상 */
	
	.form-group{margin-bottom: 20px;}
	
	.modeSet
	{
		display: block;
		margin-bottom: 8px;
		font-weight: bold;
	}
	
	textarea
	{
		width: 100%; height: 80px;
		padding: 10px; border: 1px solid #ddd;
		border-radius: 5px;
		box-sizing: border-box;
		resize: none;
		margin-top: 5px;
	}
	.btn-save
	{
		width: 100%;
		padding: 12px;
		background-color: #2980b9;
		color: #fff;
		border: none;
		border-radius: 5px;
		cursor: pointer;
		font-size: 16px;
	}
	.btn-save:hover
	{
		background-color: #3498db;
	}
	.nav-link
	{
		display: block;
		text-align: center;
		margin-top: 20px;
		color: #7f8c8d;
		text-decoration: none;
	}
	.btn-logout
	{
		width: 100%;
		padding: 12px;
		background-color: #eee;
		color: #333;
		border: none;
		border-radius: 5px;
		cursor: pointer;
		font-size: 16px;
		margin-top: 5px;
	}
	.btn-logout:hover
	{
		background-color: #aaa;
		color: #fff;
	}
	#pwd
	{
		width: 100%;
		padding: 12px;
		border: 1px solid #aaa;
		box-sizing: border-box;
		border-radius: 5px;
		cursor: pointer;
		font-size: 16px;
		margin-bottom: 5px;
	}
	

</style>
<script type="text/javascript">

	function sendIt()
	{
		let f = document.forms[0];
		let pwd =  document.getElementById("pwd");		

		
		if(pwd.value==""){
			alert("패스워드를 입력해주세요.");
			return;			
		}else if(pwd.value != "admin1234"){
			alert("올바르지 않은 패스워드입니다.");
			return;			
		}
		
		alert("로그인 성공");

		f.submit();
	}
</script>
</head>
<body>

<!-- 
	세션 접목 페이지 이거 하나 본인 요청하면서 넘기기
	로그인안한 사용자 관리자의 패스워드만 입력하는 폼이 떠야함
	정상 로그인된 관리자들만 설정 페이지 레이아웃 접근(이것도 이페이지에서 가능하도록)
	액션 취할때도 관리자인가? 정상로그인인가?확인해서 액션 처리
	어플리케이션과 세션을 합쳐서 활용해서 만들기
	
 -->
 <% if(!login){ 	// 관리자로 인증 과정을 거쳐야 하는 상황
%>
<div class="admin-login">
	<!-- 로그인 폼 -->
	<form action="" method="post" id="loginForm">
		<input type="hidden" name="act" value="login" />
		<h2>관리자 로그인</h2>
		<div>
			<input type="password" name="pwd" id="pwd" placeholder="Password" />
		</div>
		<div>
			<button type="button" class="btn-save" onclick="sendIt()">로그인</button>
		</div>
	</form>
</div>
<%}else{  			// 관리자로 인증 과정을 거친 상황
%>		
	<!-- 시스템 전역 설정 -->
<div  class="admin-card" id="systemForm">
	<h2>시스템 전역 설정</h2>
	<p>
		현재 서버 상태:
		<span class="status-badge <%= getMode? "on":"off"%>">
			<%= getMode? "점검 모드 작동 중" : "정상 가동 중"%>
		
		</span>
	</p>
	<form action="" method="post">
		<input type="hidden" name="action" value="update" />
		<div class="form-group">
			<label>점검 모드 설정</label>
			<label>
				<input type="radio" name="mode" value="ON" <%= getMode? "checked": "" %>/>
				점검 시작(ON)
			</label>
			<label>
				<input type="radio" name="mode" value="OFF" <%= !getMode? "checked": "" %> />
				정상 가동(OFF)
			</label>		
		</div>
		<div class="form-group">
			<label>점검 공지 메시지</label>
			<textarea name="msg" placeholder="메시지 작성"
			><%=getMsg %></textarea>
		</div>
		<button type="submit" class="btn-save">설정하기</button>
	</form>	 
	<form action="" method="post">
		<input type="hidden" name="logout" value="out"/>
		<button type="submit" class="btn-logout">로그아웃</button>
	</form>

</div>
<%} %>
	<a href="UserMain_1.jsp" class="nav-link">사용자 화면 확인 ▶</a>
</body>
</html>