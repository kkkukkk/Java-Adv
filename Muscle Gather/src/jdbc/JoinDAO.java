package jdbc;

import java.sql.*;
import java.util.ArrayList;

import javax.naming.NamingException;

import util.ConnectionPool;

public class JoinDAO {
	public boolean resumeinsert(String user_from_no, String user_to_no)
			throws NamingException, SQLException {
				
				Connection conn = null;
				PreparedStatement pstmt = null;
				int chk = duplicateCheck(user_from_no, user_to_no);
				
				if (chk == 0) {
					try {
						String sql = "INSERT INTO resume VALUES (?,?)";
						conn = ConnectionPool.get();
						pstmt = conn.prepareStatement(sql);
							pstmt.setString(1, user_from_no);
							pstmt.setString(2, user_to_no);
						int result = pstmt.executeUpdate();
						
						return (result==1) ? true : false;			
						 	
					}catch(Exception e){
						return false;
					}finally {
						if(pstmt != null) pstmt.close();
						if(conn != null) conn.close();
					}
				} else {
					return false;
				}
			}
	
	public int duplicateCheck(String user_from_no, String user_to_no) throws NamingException, SQLException {
			
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				try {
					String sql = "SELECT user_from_no FROM resume WHERE user_to_no = ?";
					conn = ConnectionPool.get();
					pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, user_to_no);
					rs = pstmt.executeQuery();
					
					ArrayList<String> ufn = new ArrayList<String>();
					
					while(rs.next()) {
						ufn.add(rs.getString("user_from_no"));
					}
					
					if (ufn.contains(user_from_no)) {
						return 1;						
					}else {
						return 0;
					}	
				}
				finally {
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
				}
		
	}
	
}
