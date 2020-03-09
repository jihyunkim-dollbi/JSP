package com.sist.dao;

import java.util.*;

import java.io.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MusicDAO {


	private static SqlSessionFactory ssf;
	
	
	static
	{
		try{
			
			Reader reader=Resources.getResourceAsReader("config.xml");
			ssf=new SqlSessionFactoryBuilder().build(reader);
			
		}catch(Exception ex){}
			
	}
	
	public static List<MusicVO> musicAllData(){
		
		return ssf.openSession().selectList("musicAllData");
		
	}
	
}
