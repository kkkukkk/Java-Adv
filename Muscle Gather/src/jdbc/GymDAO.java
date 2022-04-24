package jdbc;

import java.sql.*;

import javax.naming.NamingException;

import util.ConnectionPool;

public class GymDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	 
	
	// gymdetail.jsp
	public GymDTO getGym(String user_no) throws NamingException, SQLException {
		String sql = "SELECT * FROM gym WHERE user_no = ?";
		GymDTO gym = null;
		UserDTO user = new UserDAO().getUser(user_no);
		try {
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_no);
			rs = pstmt.executeQuery();
			rs.next();
			gym = new GymDTO(
					user.getUser_no(),
					user.getUser_name(),
					user.getUser_pw(),
					user.getUser_birth(),
					user.getUser_zipcode(),
					user.getUser_addr(),
					user.getUser_addrdetail(),
					user.getUser_gender(),
					user.getUser_email(),
					user.getUser_phone(),
					user.getUser_admin(),
					user.getUser_kakao(),
					user.getUser_auth(),
					user.getUser_status(),
					rs.getString("gym_no"),
					rs.getString("gym_name"),
					rs.getString("gym_content"),
					rs.getString("gym_addr"),
					rs.getString("gym_salary"),
					rs.getString("gym_secret"),
					rs.getString("gym_regdate"),
					rs.getString("gym_images")
					);
			
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				//null이 아니면 close(메모리에서 해제)시킨다.
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (Exception e) {
				throw new RuntimeException(e);
				//만약 예상못한 예외 발생시 메모리에서 해제가 안되면 문제가 생길 수 있으므로
				//런타임에러 발생시켜서 강종합니다.
			}
		}
		
		return gym;
	}//메닫중
}
