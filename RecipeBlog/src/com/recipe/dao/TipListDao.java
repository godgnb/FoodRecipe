package com.recipe.dao;

import java.sql.*;

import org.apache.tomcat.dbcp.dbcp2.PStmtKey;

import com.recipe.vo.TipListVO;

public class TipListDao {

	private static TipListDao instance = new TipListDao();
	
	public static TipListDao getInstance() {
		return instance;
	}
	
	public TipListDao() {
	}
	
	// insert할 레코드의 번호 생성 메소드
	public int NextTipNum() {
		int count = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try {
			con = DBManager.getConnection();
			sql = "SELECT max(num) FROM tiplist";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				count = rs.getInt(1) + 1;
			} else {
				count = 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
		
		return count;
	} // NextTipNum method
	
	
	// 게시글 한개 등록하는 메소드
	public void insertListTip(TipListVO tiplistVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql ="";
		
		try {
			con = DBManager.getConnection();
			sql = "INSERT INTO tiplist (num, id, passwd, subject, content, readcount, commcount, ip, regDate, reRef, reLev, reSeq)";
			sql += " VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, tiplistVO.getNum());
			pstmt.setString(2, tiplistVO.getId());
			pstmt.setString(3, tiplistVO.getPasswd());
			pstmt.setString(4, tiplistVO.getSubject());
			pstmt.setString(5, tiplistVO.getContent());
			pstmt.setInt(6, tiplistVO.getReadcount());
			pstmt.setInt(7, tiplistVO.getCommcount());
			pstmt.setString(8, tiplistVO.getIp());
			pstmt.setTimestamp(9, tiplistVO.getRegDate());
			pstmt.setInt(10, tiplistVO.getReRef());
			pstmt.setInt(11, tiplistVO.getReLev());
			pstmt.setInt(12, tiplistVO.getReSeq());
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt);
		}
	} // insertListTip method
	
	
	// 게시판(board) 테이블 레코드 개수 가져오기 메소드
	public int getListCount() {
		int count = 0;
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try {
			con = DBManager.getConnection();
			sql = "SELECT count(*) FROM tiplist";
			stmt = con.createStatement();
			
			rs = stmt.executeQuery(sql);
			
			rs.next();
			
			count = rs.getInt(1);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, stmt, rs);
		}
		return count;
	} // getListCount method
	
} // TipListDao
