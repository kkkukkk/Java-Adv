package jdbc;

import java.sql.*;
import javax.naming.*;
import util.ConnectionPool;
import java.util.ArrayList;

public class GymDAO {
	

	// gymlist.jsp
	public ArrayList<GymDTO> getList()
			   throws NamingException, SQLException {
			      
			      Connection conn = null;
			      PreparedStatement pstmt = null;
			      ResultSet rs = null;
			      
			      try {
			         String sql = "SELECT * FROM gym";
			         
			         conn = ConnectionPool.get();
			         pstmt = conn.prepareStatement(sql);
			         rs = pstmt.executeQuery();
			         
			         ArrayList<GymDTO> boards = new ArrayList<GymDTO>();
			         

			         while(rs.next()) {
			        	 boards.add(new GymDTO(rs.getString("gym_no"),
			        			 			 rs.getString("user_no"),
			                                 rs.getString("gym_name"),
			                                 rs.getString("gym_content"),
			                                 rs.getString("gym_addr"),
			                                 rs.getString("gym_salary"),
			                                 rs.getString("gym_secret"),
			                                 rs.getString("gym_regdate"),
			                                 rs.getString("gym_images")));
			         }
			         return boards;
			         
			      }finally {
			         if(rs != null) rs.close();
			         if(pstmt != null) pstmt.close();
			         if(conn != null) conn.close();
			      }
			   }

		

	
	public GymDTO getDetail(String gym_no) 
			   throws NamingException, SQLException{
			      
			      Connection conn = null;
			      PreparedStatement pstmt = null;
			      ResultSet rs = null;
			      
			      try {
			         String sql = "SELECT * FROM gym WHERE gym_no = ?";
			         
			         conn = ConnectionPool.get();
			         pstmt = conn.prepareStatement(sql);
			            pstmt.setString(1, gym_no);
			         rs = pstmt.executeQuery();
			         
			         rs.next();

			        
			         String no = rs.getString(1);
			         String user_no = rs.getString(2);
			         String gym_name = rs.getString(3);
			         String gym_content = rs.getString(4);
			         String gym_addr = rs.getString(5);
			         String gym_salary = rs.getString(6);
			         String gym_secret = rs.getString(7);
			         String gym_regdate = rs.getString(8);
			         String gym_images = rs.getString(9);
			         
			         GymDTO boards = new GymDTO(no,user_no,gym_name,gym_content,gym_addr,gym_salary, gym_secret, gym_regdate, gym_images);

			         return boards;
			         
			      }finally {
			         if(rs != null) rs.close();
			         if(pstmt != null) pstmt.close();
			         if(conn != null) conn.close();
			      }
			      

		}
	
}