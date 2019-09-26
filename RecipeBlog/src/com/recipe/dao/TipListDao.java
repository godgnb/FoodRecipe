package com.recipe.dao;

import java.sql.*;

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
			sql = "INSERT INTO tiplist (num, id, passwd, subject, content, readcount, commcount, ip, reg_date, re_ref, re_lev, re_seq)";
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
	
	
	// 게시글 한개를 가져오는 메소드
	public TipListVO getListTip(int num) {
		TipListVO tipListVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		
		try {
			con = DBManager.getConnection();
			sql = "SELECT * FROM tiplist WHERE num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				tipListVO = new TipListVO();
				tipListVO.setNum(rs.getInt("num"));
				tipListVO.setId(rs.getString("id"));
				tipListVO.setPasswd(rs.getString("passwd"));
				tipListVO.setSubject(rs.getString("subject"));
				tipListVO.setContent(rs.getString("content"));
				tipListVO.setReadcount(rs.getInt("readcount"));
				tipListVO.setCommcount(rs.getInt("commcount"));
				tipListVO.setIp(rs.getString("ip"));
				tipListVO.setRegDate(rs.getTimestamp("reg_date"));
				tipListVO.setReRef(rs.getInt("re_ref"));
				tipListVO.setReLev(rs.getInt("re_lev"));
				tipListVO.setReSeq(rs.getInt("re_seq"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
		return tipListVO;
	} // getListTip
	
} // TipListDao
