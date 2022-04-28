	package jdbc;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import javax.naming.NamingException;
import util.ConnectionPool;

public class BoardDAO {

	public ArrayList<BoardDTO> getList()
			throws NamingException, SQLException {
				
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				try {
					String sql = "SELECT * FROM board";
					
					conn = ConnectionPool.get();
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					
					ArrayList<BoardDTO> boards = new ArrayList<BoardDTO>();
					
					while(rs.next()) {
						boards.add(new BoardDTO(rs.getString("bid"),
													rs.getString("btitle"),
													rs.getString("bcontent"),
													rs.getString("buser"),
													rs.getString("bdate"),
													rs.getString("bimage"),
													rs.getString("baddr")));
					}
					return boards;
					
				}finally {
					if(rs != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
				}
			}
	
	public BoardDTO getDetail(String bid) 
			throws NamingException, SQLException{
				
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				try {
					String sql = "SELECT * FROM board WHERE bid = ?";
					
					conn = ConnectionPool.get();
					pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, bid);
					rs = pstmt.executeQuery();
					
					rs.next();

					
					String id = rs.getString(1);
					String btitle = rs.getString(2);
					String bcontent = rs.getString(3);
					String buser = rs.getString(4);
					String bdate = rs.getString(5);
					String bimage = rs.getString(6);
					String baddr = rs.getString(7);
					
					BoardDTO board = new BoardDTO(id,btitle,bcontent,buser,bdate,bimage,baddr);
					
					return board;
					
				}finally {
					if(rs != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
				}
	}
	
	public int insert(String btitle, String bcontent, String buser, String bimage, String baddr)
	throws NamingException
	{
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 1;
		try {
			String sql = "INSERT INTO board VALUES (NULL,?,?,?,?,?,?)";
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, btitle);
				pstmt.setString(2, bcontent);
				pstmt.setString(3, buser);
				pstmt.setString(4, LocalDate.now().toString());
				pstmt.setString(5, bimage);
				pstmt.setString(6, baddr);
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
	
	public int insert(String btitle, String bcontent, String buser, String baddr)
			throws NamingException
			{
				
				Connection conn = null;
				PreparedStatement pstmt = null;
				int flag = 1;
				try {
					String sql = "INSERT INTO board VALUES (NULL,?,?,?,?,NULL,?)";
					conn = ConnectionPool.get();
					pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, btitle);
						pstmt.setString(2, bcontent);
						pstmt.setString(3, buser);
						pstmt.setString(4, LocalDate.now().toString());
						pstmt.setString(5, baddr);
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
