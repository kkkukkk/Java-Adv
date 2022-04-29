package jdbc;

import java.sql.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;

import javax.naming.NamingException;

import util.ConnectionPool;

public class ChattingDAO {
	
	public boolean makeChattingRoom(String user_no) 
	throws NamingException, SQLException{
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		boolean chk = chattingRoomDuplicateCheck(user_no);
		
		if (chk) {
			try {
				String sql = "INSERT INTO chatting_room VALUES (NULL,?,?)";
				conn = ConnectionPool.get();
				pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, user_no);
					pstmt.setString(2, LocalDateTime.now().toString());
				int result = pstmt.executeUpdate();
				
				return (result==1) ? true : false;			
				 	
			}finally {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}
		}else {
			String sql = "UPDATE chatting_room SET chatr_regdate = ? WHERE user_no = ? ";
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, LocalDateTime.now().toString());
				pstmt.setString(2, user_no);
			int result = pstmt.executeUpdate();
			
			return (result==1) ? true : false;
		}

	}//메닫중
	
	
	public boolean chattingRoomDuplicateCheck(String user_no)
	throws NamingException, SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT user_no FROM chatting_room WHERE user_no = ?";
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, user_no);
			rs = pstmt.executeQuery();
			
			ArrayList<String> un = new ArrayList<String>();
			
			while(rs.next()) {
				un.add(rs.getString("user_no"));
			}
			
			if (un.contains(user_no)) {
				return false;						
			}else {
				return true;
			}	
		}
		finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
		
	}

}
