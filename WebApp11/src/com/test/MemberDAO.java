/* =========================================
 	MemberDAO.java
 	- 데이터베이스 액션 처리 전용 클래스
 	  (TBL_MEMBER 테이블 전용 DAO)
============================================*/

package com.test;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.util.DBConn;

// 1. DB연결(사용자 정의 생성자를 통해 연결) 2.메소드들 3.close()
public class MemberDAO
{
	// 주요 속성 구성 private로 변수 선언
	private Connection conn;
	
	// 데이터베이스 연결 담당 메소드
	public Connection connection() throws ClassNotFoundException, SQLException
	{
		conn = DBConn.getConnection();
		return conn;
	}
	
	// 데이터 입력 담당 메소드(→ 회원 등록)
	public int add(MemberDTO dto) throws SQLException {
		int result = 0;
		
		String sql = "INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, ?, ?)";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, dto.getName());
		pstmt.setString(2, dto.getTel());
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		
		return result;
	}
	
	// 리스트 전체 출력 담당 메소드(→ 회원 목록)
	public ArrayList<MemberDTO> list() throws SQLException
	{
		ArrayList<MemberDTO> result = new ArrayList<MemberDTO>();
		
		String sql = "SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY SID";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			MemberDTO member = new MemberDTO();
			
			member.setSid(rs.getString("SID"));
			member.setName(rs.getString("NAME"));
			member.setTel(rs.getString("TEL"));
			
			result.add(member);
		}
		rs.close();
		pstmt.close();
		
		return result;
		
	}
	
	// 전체 인원수 확인 담당 메소드(→ 회원 인원 수)
	public int count() throws SQLException
	{
		int result = 0;
		
		String sql = "SELECT COUNT(*) AS COUNT FROM TBL_MEMBER";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) 
			result = rs.getInt("COUNT");
		
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	
	// 번호 검색 담당 메소드(SID 검색)
	// → 번호(sid)를 활용하여 회원 데이터 조회
	// → 현재 번호(sid)는 TBL_MEMBER 테이블에서 식별자의 역할을 수행하고 있으며
	//	  이와 같은 경우 번호를 통한 검색 결과는 한 명의 회원일 수 밖에 없기 때문에
	//	  반환 자료형의 선택은 MemberDTO의 형태로 구성할 수 있다.
	// → 경우에 따라 list() 메소드를 중복 정의 할 경우
	//	  반환 자료형은 MemberDTO들의 형태로 구성하여 단일 MemberDTO를 반환하는
	//	  형태로 구성할 수도 있다.
	public MemberDTO searchMember(String sid) throws SQLException 
	{
		MemberDTO dto = null;
		
		String sql = "SELECT SID, NAME, TEL FROM TBL_MEMBER WHERE SID = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, sid);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next())
		{
			dto = new MemberDTO();
			
			dto.setSid(rs.getString("SID"));
			dto.setName(rs.getString("NAME"));
			dto.setTel(rs.getString("TEL"));
			
		}
		rs.close();
		pstmt.close();
		
		return dto;
	}
	
	
	// 회원 데이터 수정 담당 메소드
	public int modify(MemberDTO member) throws SQLException {
		int result = 0;
		
		String sql = "UPDATE TBL_MEMBER SET NAME=?, TEL=? WHERE SID=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, member.getName());
		pstmt.setString(2, member.getTel());
		pstmt.setInt(3, Integer.parseInt(member.getSid()));
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		
		return result;
	}
	
	// 회원 데이터 삭제 담당 메소드
	public int remove(String sid) throws SQLException {
		int result = 0;
		
		String sql = "DELETE FROM TBL_MEMBER WHERE SID = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, Integer.parseInt(sid));
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		
		return result;
	}
	
	// 자식 테이블의 참조 데이터 레코드 수 확인 메소드
	// → 성적 처리가 완료된 회원에 대해서는 삭제 처리 불가
	public int refCount(String sid) throws SQLException
	{
		int result = 0;
		
		String sql = "SELECT COUNT(*) AS COUNT FROM TBL_MEMBERSCORE WHERE SID=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, Integer.parseInt(sid));
		
		ResultSet rs = pstmt.executeQuery();

		while(rs.next()) 
			result = rs.getInt("COUNT"); 
		
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	// 데이터베이스 연결 종료(해제) 담당 메소드
	public void close() throws SQLException {
		DBConn.close();
	}
}





















