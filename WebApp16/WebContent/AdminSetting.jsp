<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 1. 한글 인코딩 설정
	request.setCharacterEncoding("UTF-8");


	// 2. 관리자가 설정을 변경하기 위해 버튼을 클릭했는지 확인
	String action = request.getParameter("action");
	
	if(action!=null && action.equals("update"))
	{
		// form 데이터 수신(폼에서 전송된 값 가져오기)
		String mode = request.getParameter("mode");
		String msg = request.getParameter("msg");
		
		// Check!
		// application 객체에 전역 설정 세팅(저장)
		// → 모든 사용자가 공유하며, 서버가 꺼지기 전까지 유지
		
		if("ON".equals(mode))
			application.setAttribute("isMaintenance", true);
		else
			application.setAttribute("isMaintenance", false);
		
		application.setAttribute("noticeMsg", msg);
		
		out.println("<script>alert('시스템 설정이 변경되었습니다.')</script>");
	}
	
	// 3. 현재 설정값 읽어오기
	// 	  → 화면에 표시하기 위한 처리
	Boolean currentMode = (Boolean)application.getAttribute("isMaintenance");
	
	if(currentMode==null)
		currentMode = false;	//-- 기본값은 점검이 아닌 상태
	
	String currentMsg = (String)application.getAttribute("noticeMsg");
	if(currentMsg==null)
		currentMsg = "현재 정기 점검 중이 아닙니다.";
	
	
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AdminSetting.jsp</title>
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
</style>
</head>
<body>
<div class="admin-card">
	<h2>시스템 전역 설정</h2>
	<p>
		현재 서버 상태: 
		<!-- <span class="status-badge"> -->
		<span class="status-badge <%= currentMode ? "on" : "off" %>">
			<!-- 정상 운영 중 or 점검 모드 작동 중 -->
			<%=currentMode? "점검 모드 작동 중" : "정상 운영 중" %>
		</span>
	</p>
	
<!-- Self Post Back - 자기자신으로 돌아가기 
	<form method="post">
	<form action="" method="post"> -->
	<form action="AdminSetting.jsp" method="post">
		<input type="hidden" name="action" value="update" />
		<div class="form-group">
			<label class="modeSet">점검 모드 설정</label>
			<label>
				<!-- <input type="radio" name="mode" value="ON" /> 점검 시작(ON) -->
				<input type="radio" name="mode" value="ON" 
				<%=currentMode? "checked" : "" %> /> 점검 시작(ON)
			</label>
			<label>
				<!-- <input type="radio" name="mode" value="OFF"  /> 정상 가동(OFF) -->
				<input type="radio" name="mode" value="OFF" 
				<%=!currentMode? "checked" : "" %> /> 정상 가동(OFF)
			</label>
		</div>
		<div class="form-group">
			<label for="">점검 공지 메시지</label>
			<!-- <textarea>오전 10시부터 11시까지 정기 점검입니다.</textarea> -->
			<textarea name="msg" placeholder="사용자에게 보여줄 메시지를 입력하세요."
			><%=currentMsg %></textarea>
		</div>
			
			<button type="submit" class="btn-save">설정 적용하기</button>
	</form>
	<br />
	<a href="UserMain.jsp" class="nav-link">사용자 메인 페이지로 이동하여 확인하기 ▶</a>
</div>
</body>
</html>