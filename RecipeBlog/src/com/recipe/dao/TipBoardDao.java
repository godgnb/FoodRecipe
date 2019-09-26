package com.recipe.dao;

import java.sql.*;

import com.recipe.vo.TipBoardVO;

public class TipBoardDao {

	private static TipBoardDao instance = new TipBoardDao();
	
	public static TipBoardDao getInstance() {
		return instance;
	}
	
	public TipBoardDao() {
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
			sql = "SELECT max(num) FROM tipboard";
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
	public void insertboardTip(TipBoardVO tipboardVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql ="";
		
		try {
			con = DBManager.getConnection();
			sql = "INSERT INTO tipboard (num, id, passwd, subject, content, readcount, commcount, ip, reg_date, re_ref, re_lev, re_seq)";
			sql += " VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, tipboardVO.getNum());
			pstmt.setString(2, tipboardVO.getId());
			pstmt.setString(3, tipboardVO.getPasswd());
			pstmt.setString(4, tipboardVO.getSubject());
			pstmt.setString(5, tipboardVO.getContent());
			pstmt.setInt(6, tipboardVO.getReadcount());
			pstmt.setInt(7, tipboardVO.getCommcount());
			pstmt.setString(8, tipboardVO.getIp());
			pstmt.setTimestamp(9, tipboardVO.getRegDate());
			pstmt.setInt(10, tipboardVO.getReRef());
			pstmt.setInt(11, tipboardVO.getReLev());
			pstmt.setInt(12, tipboardVO.getReSeq());
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt);
		}
	} // insertboardTip method
	
	
	// 게시판(board) 테이블 레코드 개수 가져오기 메소드
	public int getboardCount() {
		int count = 0;
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try {
			con = DBManager.getConnection();
			sql = "SELECT count(*) FROM tipboard";
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
	} // getboardCount method
	
	
	// 게시글 한개를 가져오는 메소드
	public TipBoardVO getboardTip(int num) {
		TipBoardVO tipboardVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		
		try {
			con = DBManager.getConnection();
			sql = "SELECT * FROM tipboard WHERE num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				tipboardVO = new TipBoardVO();
				tipboardVO.setNum(rs.getInt("num"));
				tipboardVO.setId(rs.getString("id"));
				tipboardVO.setPasswd(rs.getString("passwd"));
				tipboardVO.setSubject(rs.getString("subject"));
				tipboardVO.setContent(rs.getString("content"));
				tipboardVO.setReadcount(rs.getInt("readcount"));
				tipboardVO.setCommcount(rs.getInt("commcount"));
				tipboardVO.setIp(rs.getString("ip"));
				tipboardVO.setRegDate(rs.getTimestamp("reg_date"));
				tipboardVO.setReRef(rs.getInt("re_ref"));
				tipboardVO.setReLev(rs.getInt("re_lev"));
				tipboardVO.setReSeq(rs.getInt("re_seq"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
		return tipboardVO;
	} // getboardTip
	
} // TipboardDao
