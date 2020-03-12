package com.sist.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;


public class fileBoardDAO {

	private Connection conn;
	private PreparedStatement ps;
	private final String URL="jdbc:oracle:thin:@localhost:1521:XE";
	
	//드라이버 등록
	public fileBoardDAO()
	{
		
		try{
			
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
		}catch(Exception ex)
		{
			ex.printStackTrace();
			
		}
		
		
	}
	
	//연결
	
	public void getConnection()
	{
		
		try{
			
			conn=DriverManager.getConnection(URL,"hr", "happy");
			
		}catch(Exception ex)
		{
			

		}
	
		
	}
	
	
	//연결 해제
	public void disConnection(){
		
		try{
			
			
			if(ps!=null) ps.close();
			if(conn!=null) conn.close();
			
			
		}catch(Exception ex) {}
		
		
	}	
	
	
	//목록 출력
	public List<fileBoardVO> boardListData(int page)
	{
		List<fileBoardVO> list= new ArrayList<fileBoardVO>();
		
		try{
			
			getConnection();
			
			//rownum => 다음글 이전글/ 이전페이지 다음페이지 에 사용!! rownum+1!!
			String sql="SELECT no, subject, name, regdate, hit, num "
					+ "FROM (SELECT no, subject, name, regdate, hit, rownum as num "
					+ "FROM (SELECT no, subject, name, regdate, hit "
					+ "FROM fileBoard ORDER BY no DESC)) "
					+ "WHERE num BETWEEN ? AND ?";
			
				ps=conn.prepareStatement(sql);
				int rowSize=10;
				int start=(rowSize*page)-(rowSize-1);
				int end=rowSize*page;
				
				ps.setInt(1, start);
				ps.setInt(2, end);
				
				
				ResultSet rs=ps.executeQuery();
				
				
				while(rs.next())
				{
					fileBoardVO vo=new fileBoardVO();
					
					vo.setNo(rs.getInt(1));
					vo.setSubject(rs.getString(2));
					vo.setName(rs.getString(3));
					vo.setRegdate(rs.getDate(4));
					vo.setHit(rs.getInt(5));			
					vo.setRownum(rs.getInt(6));
					
					
					list.add(vo);
					
				}
				rs.close();
			
		}catch(Exception ex)
		{
			ex.printStackTrace();
			
		}finally
		{
			disConnection();
			
		}
		
		return list;
	}
	
	
	
	
	
}
