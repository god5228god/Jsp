package com.test;

public class GuestBean
{
	private String writer, title, contents;
	
	// Check!
	// ※ 여기에서 사용하는(선언하는) 변수명(속성명)의
	//	  앞 두 글자는 가급적 소문자로 작성할 것
	
	// userName → getUserName() / setUserName()
	// uName → getUName() / setUName()
	// uName → getuName() / setuName()
	
	// 과 같이 getter/ setter가 속성의 이름을 불러오는 과정에서
	// 인식이 어긋나는 경우가 발생할 수 있기 때문
	
	// ※ 여기서 사용하는(선언하는) 변수명(속성명)은
	//    HTML(JSP)의 form에서 name 속성으로 지정하여 사용할 것
	//    그래야 속성 데이터 수신 및 속성 매핑을
	//    액션 태그를 활용하여 자동으로 비교적 편하게 처리해줄 수 있기 때문

	public String getWriter()
	{
		return writer;
	}

	public void setWriter(String writer)
	{
		this.writer = writer;
	}

	public String getTitle()
	{
		return title;
	}

	public void setTitle(String title)
	{
		this.title = title;
	}

	public String getContents()
	{
		return contents;
	}

	public void setContents(String contents)
	{
		this.contents = contents;
	}
	
	public String result()
	{
		String result = "";
		
		result = "작성자: " + writer + ", 제목: "+ title + ", 내용: "+contents;
		
		return result;
	}
}
