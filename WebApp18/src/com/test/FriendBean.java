package com.test;

public class FriendBean
{
	private String userName, userAge, gender;
	// check! 
	private String[] iden;
	//-- 여러 개의 데이터가 동시에 전달될 수 있는 구조이므로
	// 	 (즉, 다중 선택이 가능하도록 구성하였기 때문에)
	//	  배열과 같은 자료구조로 처리할 수 있다.
	
	public String getUserName()
	{
		return userName;
	}
	public void setUserName(String userName)
	{
		this.userName = userName;
	}
	public String getUserAge()
	{
		return userAge;
	}
	public void setUserAge(String userAge)
	{
		this.userAge = userAge;
	}
	public String getGender()
	{
		return gender;
	}
	public void setGender(String gender)
	{
		this.gender = gender;
	}
	public String[] getIden()
	{
		return iden;
	}
	public void setIden(String[] iden)
	{
		this.iden = iden;
	}
}
