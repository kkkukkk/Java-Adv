package jdbc;

import java.sql.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
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
					String sql = "SELECT * FROM trainer WHERE trainer_secret != 1 ORDER BY trainer_no DESC LIMIT ?, ?";
					
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
							String sql = "SELECT * FROM trainer WHERE trainer_content LIKE '%"+searchinfo+"%' AND trainer_secret != 1 ORDER BY trainer_no DESC LIMIT ?,?";
							
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
							String sql = "SELECT * FROM trainer WHERE trainer_addr LIKE '%"+searchinfo+"%' AND trainer_secret != 1 ORDER BY trainer_no DESC LIMIT ?,?";
							
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
	
	public TrainerDTO getTrainerDetail(String trainer_no) 
			throws NamingException, SQLException{
				
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				try {
					String sql = "SELECT * FROM trainer WHERE trainer_no = ?";
					
					conn = ConnectionPool.get();
					pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, trainer_no);
					rs = pstmt.executeQuery();
					
					rs.next();
					
					String no = rs.getString(1);
					String user_no = rs.getString(2);
					String trainer_title = rs.getString(3);
					String trainer_content = rs.getString(4);
					String trainer_addr = rs.getString(5);
					String trainer_secret = rs.getString(6);
					String trainer_regdate = rs.getString(7);
					String trainer_images = rs.getString(8);
					
					UserDTO user = new UserDAO().getUser(user_no);
							
					TrainerDTO trainer = new TrainerDTO(user_no,
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
													no,
													trainer_title,
													trainer_content,
													trainer_secret, 
													trainer_addr,
													trainer_regdate,
													trainer_images);
					
					return trainer;
					
				}finally {
					if(rs != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
				}		
				
				
	}
	
	
	public String getResumeCountTrainer(String trainer_no) throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT COUNT(*) FROM resume WHERE user_to_no = ?";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, trainer_no);
			rs = pstmt.executeQuery();
			rs.next();
			
			String cnt = rs.getString("COUNT(*)");
			
			return cnt;
			
		}finally {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}		
			
	}//메닫중
	
	
	public int trainerInsert(String trainer_title, String trainer_content, String trainer_addr, ArrayList<String> arr)
			throws NamingException
			{
				
				Connection conn = null;
				PreparedStatement pstmt = null;
				
				String trainer_images = "";
				
				for(String i : arr) {
					trainer_images += i + "/";
				}
				
				int flag = 1;
				try {
					String sql = "INSERT INTO trainer VALUES (NULL,NULL,?,?,?,?,?,?)";
					conn = ConnectionPool.get();
					pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, trainer_title);
						pstmt.setString(2, trainer_content);
						pstmt.setString(3, trainer_addr);
						pstmt.setInt(4, 0);
						pstmt.setString(5, LocalDateTime.now().toString());
						pstmt.setString(6, trainer_images);
					int result = pstmt.executeUpdate();
					
					if (result == 1) flag = 0;	
				}catch (SQLException e) {
					System.out.println("error: "+e.getMessage());
				}finally {
					if(pstmt != null) try{pstmt.close();} catch(SQLException e) {}
					if(conn != null) try{conn.close();} catch(SQLException e) {}
				}
				return flag;
			}
			
			public int trainerInsert(String trainer_title, String trainer_content, String trainer_addr)
					throws NamingException
					{
						
						Connection conn = null;
						PreparedStatement pstmt = null;
						int flag = 1;
						try {
							String sql = "INSERT INTO trainer VALUES (NULL,NULL,?,?,?,?,?,NULL)";
							conn = ConnectionPool.get();
							pstmt = conn.prepareStatement(sql);
								pstmt.setString(1, trainer_title);
								pstmt.setString(2, trainer_content);
								pstmt.setString(3, trainer_addr);
								pstmt.setInt(4, 0);
								pstmt.setString(5, LocalDateTime.now().toString());
							int result = pstmt.executeUpdate();
							
							if (result == 1) flag = 0;	
						}catch (SQLException e) {
							System.out.println("error: "+e.getMessage());
						}finally {
							if(pstmt != null) try{pstmt.close();} catch(SQLException e) {}
							if(conn != null) try{conn.close();} catch(SQLException e) {}
						}
						return flag;
					}
	
	
}
