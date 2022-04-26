package jdbc;

import java.sql.*;

import javax.naming.NamingException;

import util.ConnectionPool;

public class UserDAO {

		public UserDTO getUser(String user_no) 
				throws NamingException, SQLException{
				
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;

				
				try {
					String sql = "SELECT * FROM user WHERE user_no = ?";
					
					conn = ConnectionPool.get();
					pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, user_no);
					rs = pstmt.executeQuery();
					
					rs.next();
					
					String no = rs.getString(1);
					String user_name = rs.getString(2);
					String user_pw = rs.getString(3);
					String user_birth = rs.getString(4);
					String user_zipcode = rs.getString(5);
					String user_addr = rs.getString(6);
					String user_addrdetail = rs.getString(7);
					String user_gender = rs.getString(8);
					String user_email = rs.getString(9);
					String user_phone = rs.getString(10);
					String user_admin = rs.getString(11);
					String user_kakao = rs.getString(12);
					String user_auth = rs.getString(13);
					String user_status = rs.getString(14);
					
					UserDTO user = new UserDTO(no,
												user_name,
												user_pw,
												user_birth,
												user_zipcode,
												user_addr,
												user_addrdetail,
												user_gender,
												user_email,
												user_phone,
												user_admin,
												user_kakao,
												user_auth,
												user_status
												);
					
					return user;
					
				}finally {
					if(rs != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
				}
				
			}
		
		public int login(String user_email, String user_pw)
				throws NamingException, SQLException {	
					
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					
					if (user_pw != null) {
				
						try {
							String sql = "SELECT user_email, user_pw FROM user where user_email = ?";
							
							conn = ConnectionPool.get();
							pstmt = conn.prepareStatement(sql);
									pstmt.setString(1,user_email);
							rs = pstmt.executeQuery();
							
							if (!rs.next()) return 1;                        //회원이 아닌 경우
							if (!user_pw.equals(rs.getString("user_pw"))) return 2;  //암호 틀린 경우
							
							return 0;
						} finally {
							if(rs != null) rs.close();
							if(pstmt != null) pstmt.close();
							if(conn != null) conn.close();
						}
					} else {
						return 2;
					}
				
				
				}

}
