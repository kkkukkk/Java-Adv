package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;

import util.ConnectionPool;

public class OrderDAO {
	
	
	public ArrayList<OrderDTO> getList()
			throws NamingException, SQLException {
				
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				try {
					String sql = "SELECT * FROM orders";
					
					conn = ConnectionPool.get();
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					
					ArrayList<OrderDTO> orders = new ArrayList<OrderDTO>();
					
					while(rs.next()) {
						orders.add(new OrderDTO(rs.getString("oid"),
													rs.getString("opid"),
													rs.getString("ouid"),
													rs.getString("opname"),
													rs.getString("oprice"),
													rs.getString("ostatus"),
													rs.getString("odate"),
													rs.getString("ograde"),
													rs.getString("ocomm")));
					}
					return orders;
					
				}finally {
					if(rs != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
				}
			}
	
	public ArrayList<OrderDTO> getList(String status)
			throws NamingException, SQLException {
				
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				try {
					String sql = "SELECT * FROM orders WHERE ostatus = ?";
					
					conn = ConnectionPool.get();
					pstmt = conn.prepareStatement(sql);
						pstmt.setString(1,status);
					rs = pstmt.executeQuery();
					
					ArrayList<OrderDTO> orders = new ArrayList<OrderDTO>();
					
					while(rs.next()) {
						orders.add(new OrderDTO(rs.getString("oid"),
													rs.getString("opid"),
													rs.getString("ouid"),
													rs.getString("opname"),
													rs.getString("oprice"),
													rs.getString("ostatus"),
													rs.getString("odate"),
													rs.getString("ograde"),
													rs.getString("ocomm")));
					}
					return orders;
					
				}finally {
					if(rs != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
				}
			}
	
	
	// ?????? ?????? ????????? status1 ??????
	public int insert() {
		
		
	return 1;
	}
	
	
	// ?????? ?????? ????????? status2 ??????
	public int confirm() {
		
	return 1;
	}
	
	// ?????? ????????? status4 ?????????
	public int delivery() {
			
	return 1;
	}

	// ?????? ?????? ????????? status2 ??????
	public int ????????????() {
			
	return 1;
	}
}
