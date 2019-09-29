package com.soccer.web.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class test {
	public static void main(String[] args) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String url = "jdbc:oracle:thin:@localhost:1521:xe", 
				username = "c##bit", 
				password = "oracle";
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection(url, username, password);
			if (conn != null) {
				System.out.println("연결성공");
				stmt = conn.createStatement(); // 스테이트먼트 한장 만들어라
				rs = stmt.executeQuery("SELECT COUNT(*) count\r\n" + "FROM (SELECT PLAYER_NAME\r\n"
						+ "    FROM PLAYER \r\n" + "    WHERE NOT TEAM_ID IN ('K07','K08','K09')\r\n"
						+ "        AND NOT POSITION IN ('GK','MF'))");
				String count = "";
				while (rs.next()) {
					count = rs.getString("count");

				}
				System.out.println("선수들의 수 : " + count);
			} else {
				System.out.println("연결실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
