package jdbc;

import java.sql.*;
import java.sql.SQLException;
import java.time.LocalDate;

import javax.naming.NamingException;

import util.ConnectionPool;

public class ChattingDAO {
	
	public boolean makeChattingRoom(int user_no) 
	throws NamingException, SQLException{
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "INSERT INTO chatting_room VALUES (NULL,?,?)";
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, user_no);
				pstmt.setString(2, LocalDate.now().toString());
			int result = pstmt.executeUpdate();
			
			return (result==1) ? true : false;			
			 	
		}finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}

	}

}
