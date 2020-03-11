package com.sist.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.*;


import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.sist.manager.ThemaManager;
import com.sist.vo.DetailThemaVO;




//connection pool

public class detailThemaDAO {

	private Connection conn;
	private PreparedStatement ps;
	private static detailThemaDAO dao; //싱클톤 만들기
	private ThemaManager mgr;
	
	
	
	//연결
	public void getConnection()
	{
		try
		{
			Context init=new InitialContext(); //탐색기 열기
			Context c=(Context)init.lookup("java://comp//env");
			DataSource ds=(DataSource)c.lookup("jdbc/oracle");
			conn=ds.getConnection();
			
		}catch(Exception ex)
		{
			ex.printStackTrace();	
		}
		
	}
	
	//반환
	public void disConnection()
	{
		try
		{
			if(ps!=null) ps.close();
			if(conn!=null) conn.close();
			
		}catch(Exception ex) {}
		
	}
	
	public static detailThemaDAO newInstance()
	{
		if(dao==null)
			dao=new detailThemaDAO();
		return dao;
		
	}
	
	
		
	
	
	
	
}
