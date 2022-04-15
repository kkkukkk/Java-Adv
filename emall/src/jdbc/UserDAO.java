package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDate;

import javax.naming.NamingException;

import util.ConnectionPool;

public class UserDAO {
	
	public int insert(String uid, String upw, String uname, String ugender, String ubirth, String uemail, String uphone,
			String uaddr) throws NamingException, SQLException{
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		
		try {
			String sql = "INSERT INTO user VALUES (?,?,?,?,?,?,?,?,?)";
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, uid);
				pstmt.setString(2, upw);
				pstmt.setString(3, uname);
				pstmt.setString(4, ugender);
				pstmt.setString(5, ubirth);
				pstmt.setString(6, uemail);
				pstmt.setString(7, uphone);
				pstmt.setString(8, uaddr);
				pstmt.setString(9, LocalDate.now().toString());
			int result = pstmt.executeUpdate();
			return (result);
		}finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
		
	}

}
