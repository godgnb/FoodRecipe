package com.recipe.dao;

import java.sql.*;

public class DBManager {
	public static Connection getConnection() throws Exception {
		// DB 접속정보
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		String user = "admin";
		String password = "admin";

		Connection con = null;
		// 1단계: DB 드라이버 로딩
		Class.forName("oracle.jdbc.OracleDriver");
		// 2단계: DB 연결
		con = DriverManager.getConnection(url, user, password);
		return con;
	}
	
	// SELECT문을 수행한 후 리소스 해제를 위한 메소드
		public static void close(Connection con, Statement stmt, ResultSet rs) {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (stmt != null) {
				try {
					stmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		} // close method

		// INSERT, UPDATE, DELETE문을 수행한 후 리소스 해제를 위한 메소드
		public static void close(Connection con, Statement stmt) {
			if (stmt != null) {
				try {
					stmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}

		} // close method

} // DBManager
