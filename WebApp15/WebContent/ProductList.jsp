<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ProductList.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css" />
<style type="text/css">
.inputNon{border: none; width: 150px; background-color: #fff; font-size: 16px; color: #000;}
.btn{border: none; background-color: #fce147; padding: 5px; font-weight: bold; 
color: #3d3b38; cursor: pointer; border-radius: 5px;}
.btn:hover{background-color: #3d3b38; color: #fce147; }
</style>
<script type="text/javascript">
	
	function sendIt(obj)
	{
		let f = document.forms[0];		
		let tr = obj.closest("tr");
		
		let title = tr.querySelector("[name = 'bookTitle']").value;
		let author = tr.querySelector("[name = 'author']").value;
		let publisher = tr.querySelector("[name = 'publisher']").value;
		let imgSrc = tr.querySelector("[name='imgSrc']").value;
		
		let addr = "RecentView_1.jsp?title="+title+"&author="
				+author+"&publisher="+publisher+"&imgSrc="+imgSrc;
		
		f.action = addr;
		
		f.submit();
	}
</script>
</head>
<body>
<!-- 열람한 상품을 쿠키에 담아서 확인(RecentView)  -->
<div>
	<form action="" method="post">
		<table >
			<tr>
				
				<th>제목</th>
				<th>작가</th>
				<th>출판사</th>
				<th></th>
			</tr>
			<tr>
				<td>
					<input type="text" value="싯다르타" name="bookTitle" class="inputNon" disabled="disabled"/>					
				</td>
				<td>
					<input type="text" value="헤르만헤세" name="author" class="inputNon" disabled="disabled"/>
				</td>
				<td>
					<input type="text" value="민음사" name="publisher" class="inputNon" disabled="disabled"/>
				</td>
				<td style="display:none;">				
					<input type="hidden" value="https://image.millie.co.kr/service/cover/180070787/59bb3770c3b246ca90973d16891c39bf.jpg?w=400&f=webp&q=80" name="imgSrc" />
				</td>
				<td>
					<button type="button" onclick="sendIt(this)" class="btn">상세보기</button>
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" value="쥬디할머니" name="bookTitle" class="inputNon" disabled="disabled"/>
				</td>
				<td>
					<input type="text" value="박완서" name="author" class="inputNon" disabled="disabled"/>
				</td>
				<td>
					<input type="text" value="문학동네" name="publisher" class="inputNon" disabled="disabled"/>
				</td>
				<td style="display:none;">				
					<input type="hidden" value="https://image.millie.co.kr/service/cover/180142541/78ac1239cec54d12979c7ea03f2ea016.jpg?w=200&f=webp&q=80" name="imgSrc" />
				</td>
				<td>
					<button type="button" onclick="sendIt(this)" class="btn">상세보기</button>
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" value="이기적유전자" name="bookTitle" class="inputNon" disabled="disabled"/>
				</td>
				<td>
					<input type="text" value="리처드도킨스" name="author" class="inputNon" disabled="disabled"/>
				</td>
				<td>
					<input type="text" value="을유문화사" name="publisher" class="inputNon" disabled="disabled"/>
				</td>
				<td style="display:none;">				
					<input type="hidden" value="https://image.millie.co.kr/service/cover/15926256/538ef91a7ed34194908a6a68ae86095c.jpg?w=200&f=webp&q=80" name="imgSrc" />
				</td>
				<td>
					<button type="button" onclick="sendIt(this)" class="btn">상세보기</button>
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" value="프로젝트헤일메리" name="bookTitle" class="inputNon" disabled="disabled"/>
				</td>
				<td>
					<input type="text" value="앤드위어" name="author" class="inputNon" disabled="disabled"/>
				</td>
				<td>
					<input type="text" value="RHK" name="publisher" class="inputNon" disabled="disabled"/>
				</td>
				<td style="display:none;">				
					<input type="hidden" value="https://image.millie.co.kr/service/cover/180111232/c2664b786bb44235995ccec2acf37bb6.jpg?w=200&f=webp&q=80" name="imgSrc" />
				</td>
				<td>
					<button type="button" onclick="sendIt(this)" class="btn">상세보기</button>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>