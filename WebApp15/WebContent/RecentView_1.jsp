<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String title = request.getParameter("title");
	String author = request.getParameter("author");
	String publisher = request.getParameter("publisher");
	String imgSrc = request.getParameter("imgSrc"); 
	
	Cookie cTitle = new Cookie("title", title);
	Cookie cAuthor = new Cookie("author", author);
	Cookie cPublisher = new Cookie("publisher", publisher);
	Cookie cImg = new Cookie("imgSrc", imgSrc);
	
	
	cTitle.setMaxAge(10);
	cAuthor.setMaxAge(10);
	cPublisher.setMaxAge(10);
	cImg.setMaxAge(10);
	
	response.addCookie(cTitle);
	response.addCookie(cAuthor);
	response.addCookie(cPublisher);
	response.addCookie(cImg); 
	
	// request로 받아온 값을 ArrayList에 String으로 담기
	// titleArr[0] = 싯다르타, titleArr[1] = 어쩌고,...
	// 쿠키 객체 생성해서 ArrayList에 들어 있는 값을 쿠키에 담아야 됨
	// 근데 어쨋든 제일 마지막에 들어온게 제일 앞에 있어야 됨
	// 애초에 ArrayList에 담을 때 LIFO방식으로 하면 될...까?
	// 그러면....그냥 담으면 안되고 0번에 담으면 0번에 있던애들이 뒤로 하나씩 밀려야되는데
	// 3개까지 담으니까 걍 3까지 돌릴까..?
	// 리스트에 값을 담는건 그냥 add로 담으면 되나?
	// titleArr.add(0,"싯타르타"); 이런식으로 하나만 쓰면 값이 바인딩 될때마다 누적이 되나?
		
	// 기존 쿠키 읽기 -> 리스트화 -> 새 데이터 추가 -> 다시 쿠키 굽기
	// title이라는 쿠키가 있는지 확인
	// 리스트에 담기
	// 같은 제목 기존 것 지우고 맨 앞에 넣기
	
	Cookie[] cookies = request.getCookies();
	String tValue ="";
	String aValue ="";
	String pValue ="";
	
	// 쿠키에 값이 있을 때 값 가져오기
	if(cookies != null)
	{
		for(Cookie c:cookies)
		{
			if(c.getName().equals("title"))
				tValue = c.getValue();
			if(c.getName().equals("author"))
				aValue = c.getValue();
			if(c.getName().equals("publisher"))
				pValue = c.getValue();
				
		}
	}
	
	// 쿠키에 들어 있던 값을 담을 리스트 생성
	ArrayList<String> titleArr = new ArrayList<>();
	ArrayList<String> aArr = new ArrayList<>();
	ArrayList<String> pArr = new ArrayList<>();
	
	// 쿠키 값이 있을 때 잘라서 String배열에 담아놓고 하나씩 리스트에 저장하기
	if(!tValue.equals("")){
		String[] str = tValue.split("/");
		for(String s:str)
			titleArr.add(s);
	}
	
	// 리스트에 이미 같은 값이 들어왔다면 지우기
	if(titleArr.contains(title))
		titleArr.remove(title);
	
	// 리스트에 인덱스 0번에 값 집어넣기
	titleArr.add(0, title);
	
	// 리스트 사이즈가 4이상이면 인덱스3번값 지우기
	if(titleArr.size() > 3)
		titleArr.remove(3);
	
	
/* 	if(!aValue.equals("")){
		String[] str = aValue.split("/");
		for(String s: str)
			aArr.add(s);
	}
	
	if(aArr.contains(author))
		aArr.remove(author);
	
	aArr.add(0, author);
	
	if(aArr.size()>3)
		aArr.remove(3);
	
	if(!pValue.equals(""))
	{
		String[] str = pValue.split("/");
		for(String s: str){
			pArr.add(s);
		}
	}
	if(pValue.contains(publisher)){
		pArr.remove(publisher);
	}
	
	pArr.add(0, publisher);
	
	if(pArr.size()>3){
		pArr.remove(3);
	} */
	
	// 쿠키 값이 있을 때 분리해서 리스트에 담기
	// 같은 값이 들어왔다면 지우기
	// 인덱스 0에 담기
	// 사이즈가 4이상이면 인덱스 3번 지우기
	
	String newTValue = String.join("/",titleArr);
	String newAValue = String.join("/",aArr);
	String newPValue = String.join("/",pArr);
	cTitle = new Cookie("title", newTValue);
	cAuthor = new Cookie("author", newAValue);
	cPublisher = new Cookie("publisher", newPValue);
	cTitle.setMaxAge(10);
	cAuthor.setMaxAge(10);
	cPublisher.setMaxAge(10);
	response.addCookie(cTitle);
	response.addCookie(cAuthor);
	response.addCookie(cPublisher);
	
	


	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RecentView_1.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css" />
<style type="text/css">
.btn{border: none; background-color: #fce147; padding: 5px; font-weight: bold; 
color: #3d3b38; cursor: pointer; border-radius: 5px;}
.btn:hover{background-color: #3d3b38; color: #fce147; }
img{width: 150px;}
</style>
</head>
<body>
<!-- 쿠키에 담은걸 자료구조로 리스트형식으로 담아서 최근에 본게 제일 앞으로 올 수 있도록 구성 -->
<div>
	<h1>상세보기</h1>
	<hr />
</div>
<div>
	<form action="ShowRecent_1.jsp">
		<table >
			<tr>
				<td>				
					<img src="<%=imgSrc %>" alt="도서이미지" />
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td><%= title %></td>
			</tr>
			<tr>
				<th>작가</th>
				<td><%= author %></td>
			</tr>
			<tr>
				<th>출판사</th>
				<td><%= publisher %></td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit" class="btn">최근 본 상품으로</button>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>