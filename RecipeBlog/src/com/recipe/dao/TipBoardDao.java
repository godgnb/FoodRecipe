package com.recipe.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


import com.recipe.vo.TipBoardCommentVO;
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
			sql = "INSERT INTO tipboard (num, id, passwd, subject, content, readcount, commcount, ip, reg_date)";
			sql += " VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)";
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
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt);
		}
	} // insertboardTip method
	
	
	// 검색어로 검색된 행의 시작행번호부터 갯수만큼 가져오기(페이징)
	public List<TipBoardVO> getBoards(int startRow, int pageSize, String search) {
		List<TipBoardVO> list = new ArrayList<TipBoardVO>();
		int endRow = startRow + pageSize - 1;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT aa.* ");
		sb.append("FROM ");
		sb.append("		(SELECT ROWNUM as rnum, a.* ");
		sb.append("      FROM ");
		sb.append(" 		   (SELECT * ");
		sb.append("            FROM tipboard ");
		
		if (!(search == null || search.equals(""))) { // 검색어 있을때
			sb.append("			   WHERE subject LIKE ? ");
		}
		
		sb.append("            ORDER BY num DESC) a ");
		sb.append("      WHERE ROWNUM <= ?) aa ");
		sb.append("WHERE rnum >= ? ");
		
		try {
			con = DBManager.getConnection();
			pstmt = con.prepareStatement(sb.toString());
			
			if (!(search == null || search.equals(""))) { // 검색어 있을 때
				pstmt.setString(1, "%" + search + "%");
				pstmt.setInt(2, endRow);
				pstmt.setInt(3, startRow);
			} else { // 검색어 없을 때
				pstmt.setInt(1, endRow);
				pstmt.setInt(2, startRow);
			}
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				TipBoardVO tipboardVO = new TipBoardVO();
				tipboardVO.setNum(rs.getInt("num"));
				tipboardVO.setId(rs.getString("id"));
				tipboardVO.setPasswd(rs.getString("passwd"));
				tipboardVO.setSubject(rs.getString("subject"));
				tipboardVO.setContent(rs.getString("content"));
				tipboardVO.setReadcount(rs.getInt("readcount"));
				tipboardVO.setCommcount(rs.getInt("commcount"));
				tipboardVO.setIp(rs.getString("ip"));
				tipboardVO.setRegDate(rs.getTimestamp("reg_date"));

				//리스트에 vo객체 한개 추가
				list.add(tipboardVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
		return list;
	} // getBoards method
	
	
	// 검색어로 게시판(board) 테이블 레코드 개수 가져오기 메소드
	public int getBoardCount(String search) {
		int count = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try {
			con = DBManager.getConnection();
			sql = "SELECT count(*) FROM tipboard ";
			
			if (!(search == null || search.equals(""))) {
				sql += "WHERE subject LIKE ? ";
			}
			pstmt = con.prepareStatement(sql);
			
			if (!(search == null || search.equals(""))) {
				pstmt.setString(1, "%" + search + "%");
			}
			rs = pstmt.executeQuery();
			
			rs.next();
			
			count = rs.getInt(1);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
		return count;
	} // getBoardCount method
	
	
	// 특정 레코드의 조회수를 1증가시키는 메소드
	public void updateReadCount(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		
		try {
			con = DBManager.getConnection();
			sql = "UPDATE tipboard ";
			sql += "SET readcount = readcount + 1 ";
			sql += "WHERE num = ? ";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt);
		}
	} // updateReadCount method
	
	
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
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
		return tipboardVO;
	} // getboardTip method
	
	
	// 게시글 패스워드 비교 메소드
	public boolean isPasswdEqual(int num, String passwd) {
		boolean isPasswdEqual = false;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try {
			con = DBManager.getConnection();
			sql = "SELECT count(*) ";
			sql += "FROM tipboard ";
			sql += "WHERE num = ? AND passwd = ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, passwd);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			rs.getInt(1);
			
			if (rs.getInt(1) == 1) {
				isPasswdEqual = true; // 게시글 패스워드 같음
			} else {
				isPasswdEqual = false; // 게시글 패스워드 다름
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
		return isPasswdEqual;
	} // isPasswdEqual method
	
	
	// 게시글 수정하기 메소드
	public void updateBoard(TipBoardVO tipBoardVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		
		try {
			con = DBManager.getConnection();
			sql = "UPDATE tipboard ";
			sql += "SET subject = ?, content = ? ";
			sql += "WHERE num = ? ";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, tipBoardVO.getSubject());
			pstmt.setString(2, tipBoardVO.getContent());
			pstmt.setInt(3, tipBoardVO.getNum());
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt);
		}
	} // UpdateBoard method
	
	
	// 게시글 삭제하기 메소드
	public void deleteBoard (int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		
		try {
			con = DBManager.getConnection();
			sql = "DELETE FROM tipboard WHERE num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			pstmt.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt);
		}
	} // deleteBoard method
	
	
	// 게시글에 댓글 한개 등록하는 메소드
	public int insertComment (TipBoardCommentVO tipboardcommentVO) {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		StringBuilder sb = new StringBuilder();
		
		try {
			con = DBManager.getConnection();
			sb.append("INSERT INTO tipboardcomment (re_num, name, content, re_date, num) ");
			sb.append(" VALUES (?, ?, ?, ?, ?)");
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setInt(1, tipboardcommentVO.getReNum());
			pstmt.setString(2, tipboardcommentVO.getName());
			pstmt.setString(3, tipboardcommentVO.getContent());
			pstmt.setTimestamp(4, tipboardcommentVO.getReDate());
			pstmt.setInt(5, tipboardcommentVO.getNum());
			
			result = pstmt.executeUpdate();
			
		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt);
		}
		return result;
	} // insertComment method
	
	
	// insert할 게시물의 댓글번호 생성 메소드
	public int nextCommentNum() {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try {
			con = DBManager.getConnection();
			// num 컬럼값중에 최대값 구하기. 레코드 없으면 null
			sql = "SELECT MAX(re_num) FROM tipboardcomment ";
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				result = rs.getInt(1) + 1;
			} else {
				result = 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
		return result;
	} // nextBoardNum method
	
	

	//게시글 답글 출력하는 메소드
	public List<TipBoardCommentVO> getComment(int num) {
		List<TipBoardCommentVO> list = new ArrayList<TipBoardCommentVO>();
	
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuilder sb = new StringBuilder();
		
		sb.append("SELECT * ");
		sb.append("FROM tipboardcomment ");
		sb.append("WHERE num = ? ");
		sb.append("ORDER BY re_num ");
		
		try {
			con = DBManager.getConnection();
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();

			while (rs.next()) {
				TipBoardCommentVO tipBoardCommentVO = new TipBoardCommentVO();
				tipBoardCommentVO.setReNum(rs.getInt("re_num"));
				tipBoardCommentVO.setName(rs.getString("name"));
				tipBoardCommentVO.setContent(rs.getString("content"));
				tipBoardCommentVO.setReDate(rs.getTimestamp("re_date"));
				tipBoardCommentVO.setNum(rs.getInt("num"));

				list.add(tipBoardCommentVO);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt, rs);
		}
		return list;
	} // getComment method
	
} // TipboardDao
