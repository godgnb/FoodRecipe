package com.recipe.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.recipe.vo.TipBoardAttachVO;

public class TipBoardAttachDao {

	private static TipBoardAttachDao instance = new TipBoardAttachDao();
	
	public static TipBoardAttachDao getInstance() {
		return instance;
	}
	
	public TipBoardAttachDao() {
	}
	
	// 첨부파일 한개 등록하는 메소드
	public void insertAttach(TipBoardAttachVO tipBoardAttachVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		
		try {
			con = DBManager.getConnection();
			sql  = "INSERT INTO tipboardattach (uuid, filename, filetype, bno) ";
			sql += "VALUES (?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, tipBoardAttachVO.getUuid());
			pstmt.setString(2, tipBoardAttachVO.getFilename());
			pstmt.setString(3, tipBoardAttachVO.getFiletype());
			pstmt.setInt(4, tipBoardAttachVO.getBno());
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(con, pstmt);
		}
		
		
		
	} // insertAttach method
	
	
} // TipListAttachDao class
