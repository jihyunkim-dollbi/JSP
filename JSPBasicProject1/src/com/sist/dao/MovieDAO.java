package com.sist.dao;
/*
 * 데이터가 많아서 페이지 나눌 예정! 

 */
import java.util.*;

import java.io.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;


public class MovieDAO {

	private static SqlSessionFactory ssf;
	
	static
	{
		try{
			
			Reader reader=Resources.getResourceAsReader("config.xml");
			ssf=new SqlSessionFactoryBuilder().build(reader);
			
		}catch(Exception ex){}
			
	}
	
	public static List<MovieVO> movieAllData(){
		
		return ssf.openSession().selectList("movieAllData");
		
	}
	
}
