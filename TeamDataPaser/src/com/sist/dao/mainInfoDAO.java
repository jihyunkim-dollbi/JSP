package com.sist.dao;


import java.sql.Connection;
import java.sql.*;

import com.sist.vo.*;

public class mainInfoDAO { //오라클에 연결하는 클래스

	private Connection conn;  // 오라클 연결
	private PreparedStatement ps; // sql문장 읽기 
	private final String URL="jdbc:oracle:thin:@localhost:1521:XE";
	
	public mainInfoDAO(){ //생성자
		
		try{
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		
	}
	
		//오라클 연결
		public void getConnection(){
			
			
			try
			{
				conn=DriverManager.getConnection(URL,"hr","happy");
				
			}catch(Exception ex) {}	
		}
		
		//오라클 해제
		public void disConnection()
		{
			
			try
			{
				
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
				
				
			}catch(Exception ex) {}		
		}
	
	
	public void mainInfotTableCreate() {
		

		try{
			
			getConnection();
			String sql="";
			
			
		}catch(Exception ex)
		{
			ex.printStackTrace();
			
		}finally{
			
			disConnection();
			
		}
		
	}	
		

		public void mainInfoInsert() {
			

			try{
				
				getConnection();
				
				String sql="";
				
				
			}catch(Exception ex)
			{
				ex.printStackTrace();
				
			}finally{
				
				disConnection();
				
			}	
		
	}
	
	
	
	
	
	
	
	
	
	
		
		
	
}
