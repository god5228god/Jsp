package com.test;

public class GuestBean
{
	private String writer, title, contents;

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
