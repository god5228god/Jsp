<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ProductList.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/main.css"> -->
<style type="text/css">
	body
	{
		font-family: "맑은 고딕";
		background-color: #f4f7f6;
		padding: 40px;
	}
	
	h2
	{
		color: #2c3e50;
		text-align: center;
	}
	
	.product-list
	{
		display: flex;
		justify-content: center;
		gap: 20px;
		flex-wrap: wrap;
		margin-top: 30px;
	}
	
	.product-card
	{
		background: white;
		border: 1px solid #ddd;
		padding: 20px;
		border-radius: 10px; width: 180px;
		text-align: center;
		transition: transform 0.2s;
		box-shadow: 0 2px 5px rgba(0,0,0,0.05);
	}
	.product-card:hover
	{		
		transform: translateY(-5px);	/* Y 축 위치좌표 이동 */
		border-color: #3498db;
	}
	
	.product-name
	{
		font-size: 18px;
		font-weight: bold;
		margin-bottom: 15px;
		display: block;
	}
	
	.btn-view
	{
		text-decoration: none;
		padding: 8px 15px;
		background-color: #3498db;
		color: white;
		border-radius: 5px;
		font-size: 14px;
	}
	.btn-view:hover { background-color: #2980b9; }
	
	.recent-box
	{
		margin-top: 50px;
		text-align: center;
		padding: 20px;
		background: #eee;
		border-radius: 10px;
	}
</style>

</head>
<body>

<!-- 
	○ Cookie 실습
	
	   - ProductList.jsp (상품 목록 구성, 데이터 발생)
	     ↓
	   - RecentView.jsp (데이터 넘겨받아 쿠키 생성)
	     ↓
	   - ShowRecent.jsp (쿠키를 읽어 화면에 출력)
	   
	   3단계 흐름으로 구성할 것.  
-->


<div>
	<h1>오늘의 추천 상품</h1>
	<hr>
</div>
<br><br>

<p style="text-align:center; color:#666;">상품 클릭 시 『최근 본 상품』 쿠키가 저장됩니다.</p>

<div class="product-list">
	<div class="product-card">
		<span class="product-name">맥북 프로</span>
		<!-- <a href="RecentView.jsp?pName=MacBookPro" class="btn-view">상세보기</a> -->
		<a href="RecentView_1.jsp?pName=MacBookPro" class="btn-view">상세보기</a>
	</div>
	<div class="product-card">
		<span class="product-name">아이폰 15</span>
		<!-- <a href="RecentView.jsp?pName=iPhone15" class="btn-view">상세보기</a> -->
		<a href="RecentView_1.jsp?pName=iPhone15" class="btn-view">상세보기</a>
	</div>
	<div class="product-card">
		<span class="product-name">에어팟 맥스</span>
		<!-- <a href="RecentView.jsp?pName=AirPodsMax" class="btn-view">상세보기</a> -->
		<a href="RecentView_1.jsp?pName=AirPodsMax" class="btn-view">상세보기</a>
	</div>
	<div class="product-card">
		<span class="product-name">애플 워치</span>
		<!-- <a href="RecentView.jsp?pName=AppleWatch" class="btn-view">상세보기</a> -->
		<a href="RecentView_1.jsp?pName=AppleWatch" class="btn-view">상세보기</a>
	</div>
</div>

<div class="recent-box">
	<!-- 
	<a href="ShowRecent.jsp" class="btn-view"
	style="color: #2c3e50; background-color: white; font-weight: bold;">
		내가 방금 본 상품 확인하기
	</a>
	-->	
	
	<a href="ShowRecent_1.jsp" class="btn-view"
	style="color: #2c3e50; background-color: white; font-weight: bold;">
		내가 방금 본 상품 확인하기
	</a>
	
</div>


</body>
</html>