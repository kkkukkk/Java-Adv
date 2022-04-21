package jdbc;

import java.sql.*;
import java.util.ArrayList;
import javax.naming.NamingException;

import util.ConnectionPool;

public class TrainerDAO {

	public TrainerDTO getTrainer(String user_no)
	throws NamingException, SQLException {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			TrainerDTO trainer = null;
			UserDTO user = new UserDAO().getUser(user_no);

			String sql = "SELECT * FROM trainer WHERE user_no = ?";

			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_no);
			rs = pstmt.executeQuery();
			rs.next();

			trainer = new TrainerDTO(user.getUser_no(),
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
									rs.getString("trainer_no"),
									rs.getString("trainer_title"),
									rs.getString("trainer_content"),
									rs.getString("trainer_secret"),
									rs.getString("trainer_addr"),
									rs.getString("trainer_regdate"),
									rs.getString("trainer_images"));

			return trainer;
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
	}

	
	
	public ArrayList<TrainerDTO> getTrainerList()
			throws NamingException, SQLException {
				
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs_in = null;
				
				try {
					String sql = "SELECT * FROM trainer";
					
					conn = ConnectionPool.get();
					pstmt = conn.prepareStatement(sql);
					rs_in = pstmt.executeQuery();
					
					ArrayList<TrainerDTO> trainers = new ArrayList<TrainerDTO>();
					
					while(rs_in.next()) {
						String t_no = rs_in.getString("user_no");
						trainers.add(getTrainer(t_no));
					}
					return trainers;
					
				}finally {
					if(rs_in != null) rs_in.close();
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
				}
			}
	
	public ArrayList<TrainerDTO> getTrainerList(int start, int line)
			throws NamingException, SQLException {
				
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs_in = null;
				
				try {
					String sql = "SELECT * FROM trainer ORDER BY trainer_no DESC LIMIT ?, ?";
					
					conn = ConnectionPool.get();
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, start);
					pstmt.setInt(2, line);
					
					rs_in = pstmt.executeQuery();
					
					ArrayList<TrainerDTO> trainers = new ArrayList<TrainerDTO>();
					
					while(rs_in.next()) {
						String t_no = rs_in.getString("user_no");
						trainers.add(getTrainer(t_no));
					}
					return trainers;
					
				}finally {
					if(rs_in != null) rs_in.close();
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
				}
				
				
			}
	
	//검색용
	public ArrayList<TrainerDTO> getTrainerSearchedList(String searchinfo, int start, int line, int flag)
			throws NamingException, SQLException {
				
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs_in = null;
				
				ArrayList<TrainerDTO> trainers = new ArrayList<TrainerDTO>();
				
				if (flag == 0) {
					try {
						String sql = "SELECT * FROM trainer WHERE trainer_content LIKE '%"+searchinfo+"%' ORDER BY trainer_no DESC LIMIT ?,?";
						
						conn = ConnectionPool.get();
						pstmt = conn.prepareStatement(sql);
						pstmt.setInt(1, start);
						pstmt.setInt(2, line);
						rs_in = pstmt.executeQuery();
						
						while(rs_in.next()) {
							String t_no = rs_in.getString("user_no");
							trainers.add(getTrainer(t_no));
						}
					}finally {
						if(rs_in != null) rs_in.close();
						if(pstmt != null) pstmt.close();
						if(conn != null) conn.close();
					}
					
				} else if (flag == 1) {
					try {
						String sql = "SELECT * FROM trainer WHERE trainer_addr LIKE '%"+searchinfo+"%' ORDER BY trainer_no DESC LIMIT ?,?";
						
						conn = ConnectionPool.get();
						pstmt = conn.prepareStatement(sql);
						pstmt.setInt(1, start);
						pstmt.setInt(2, line);
						rs_in = pstmt.executeQuery();
						
						while(rs_in.next()) {
							String t_no = rs_in.getString("user_no");
							trainers.add(getTrainer(t_no));
						}				
					}finally {
						if(rs_in != null) rs_in.close();
						if(pstmt != null) pstmt.close();
						if(conn != null) conn.close();
					}
				}
				return trainers;
				
			}//메닫중
	
	
}
