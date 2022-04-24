package jdbc;

import java.sql.*;

import javax.naming.NamingException;

import util.ConnectionPool;

public class JoinDAO {
	public boolean resumeinsert(String user_from_no, String user_to_no)
			throws NamingException, SQLException {
				
				Connection conn = null;
				PreparedStatement pstmt = null;
				
				try {
					String sql = "INSERT INTO resume VALUES (?,?)";
					conn = ConnectionPool.get();
					pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, user_from_no);
						pstmt.setString(2, user_to_no);
					int result = pstmt.executeUpdate();
					
					return (result==1) ? true : false;			
					
				} finally {
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
				}
			}
}
