package com.recipe.dao;

import java.sql.*;

import com.recipe.vo.MemberVO;

public class MemberDao {

	private static MemberDao instance = new MemberDao();
	
	public static MemberDao getInstance() {
		return instance;
	}
	
	public MemberDao() {
	}
	
	// 아이디 중복여부 확인 메소드
	public boolean isIdDupCheck(String id) {
		boolean isIdDupCheck = false;
		
		int count = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try {
			con = DBManager.getConnection();
			sql = "SELECT COUNT(*) FROM member WHERE id =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			rs.next();
			
			count = rs.getInt(1);
			if (count == 1) {
				isIdDupCheck = true;
			} else {
				isIdDupCheck = false;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt);
		}
		
		
		return isIdDupCheck;
	} // isIdDupCheck
	
	
	// 회원가입 메소드
	public int insertMember(MemberVO vo) {
		
		int rowCount = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		
		try {
			con = DBManager.getConnection();
			sql = "INSERT INTO member (id, passwd, name, phone, email, reg_date)";
			sql += " VALUES (?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPasswd());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getPhone());
			pstmt.setString(5, vo.getEmail());
			pstmt.setTimestamp(6, vo.getRegdate());
			
			rowCount = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt);
		}
		return rowCount;
	} // insertMember
	
	
	// 해당 유저 비밀번호 확인 메소드
	public int userCheck(String id, String passwd) {
		int check = -1;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql ="";
		
		try {
			con = DBManager.getConnection();
			sql = "SELECT passwd FROM member WHERE id =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				if (passwd.equals(rs.getString("passwd"))) {
					check = 1;
				} else {
					check = 0;
				}
			} else {
				check = -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
		return check;
	} // userCheck
	
	
	// 회원정보 불러오는 메소드 호출
	public MemberVO getMember(String id) {
		MemberVO memberVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try {
			con = DBManager.getConnection();
			sql = "SELECT * FROM member WHERE id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				memberVO = new MemberVO();
				
				memberVO.setId(rs.getString("id"));
				memberVO.setPasswd(rs.getString("passwd"));
				memberVO.setName(rs.getString("name"));
				memberVO.setPhone(rs.getString("phone"));
				memberVO.setEmail(rs.getString("email"));
				memberVO.setRegdate(rs.getTimestamp("reg_date"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
		return memberVO;
	} // getMember method
	
	
	// 회원정보 수정하기 메소드
	public int updateMember(MemberVO memberVO) {
		int rowCount = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		
		try {
			con = DBManager.getConnection();
			sql = "UPDATE member SET name = ?, phone = ?, email = ? WHERE id = ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memberVO.getName());
			pstmt.setString(2, memberVO.getPhone());
			pstmt.setString(3, memberVO.getEmail());
			pstmt.setString(4, memberVO.getId());
			
			rowCount = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt);
		}
		return rowCount;
	} // updateMember method
	
	
	// 회원정보 삭제하기 메소드
	public int deleteMember(String id) {
		int rowCount = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		
		try {
			con = DBManager.getConnection();
			sql = "DELETE FROM member WHERE id =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rowCount = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt);
		}
		
		return rowCount;
	} // deleteMember method
	
} // MemberDao
