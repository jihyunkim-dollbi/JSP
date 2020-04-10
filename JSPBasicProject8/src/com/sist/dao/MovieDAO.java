package com.sist.dao;

import java.sql.*;
import java.util.*;

import oracle.sql.ARRAY;

//액션빈
public class MovieDAO {

	private Connection conn;
	private PreparedStatement ps;
	private final String URL="jdbc:oracle:thin:@localhost:1521:XE";
	
	//드라이버 등록
	public MovieDAO()
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
	
	
	public List<MovieBean> movieListData(int page)
	{
		List<MovieBean> list= new ArrayList<MovieBean>();
		
		try{
			
			getConnection();
			//처음에 첨부된 페이지가 메인이라면 첨부된 페이지의 안쪽에 들어가는 정보들은 모두 메인페이지로 보냄?
			//메인만들기

			String sql="SELECT mno, poster, title,type, num "
					+ "FROM (SELECT mno, poster, title,type, rownum as num "
					+ "FROM (SELECT mno, poster, title,type "
					+ "FROM movie WHERE type=1 ORDER BY mno ASC)) "
					+ "WHERE num BETWEEN ? AND ?";
				
			
				ps=conn.prepareStatement(sql);
				int rowSize=12;
				int start=(rowSize*page)-(rowSize-1);
				int end=rowSize*page;
				
				ps.setInt(1, start);
				ps.setInt(2, end);
				
				ResultSet rs=ps.executeQuery();
				
				
				while(rs.next())
				{
					MovieBean vo=new MovieBean();
					vo.setMno(rs.getInt(1));
					vo.setPoster(rs.getString(2));
					vo.setTitle(rs.getString(3));
					vo.setType(rs.getInt(4));
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
	
	
	public int movieTotalPage(){
		
		int total=0;
		
		try{
			
			getConnection();
			String sql="SELECT CEIL(COUNT(*)/12.0) FROM movie WHERE type=1";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			
			rs.next();
			total=rs.getInt(1);
			
			rs.close();
			//db연동은 moivie에서
			
		}catch(Exception ex){
			
			ex.printStackTrace();
			
		}finally{
			
			disConnection();
			
		}
		
		return total;
		
	}
	
	
	
	public List<MovieBean> movieFindData(int page)
	{
		List<MovieBean> list= new ArrayList<MovieBean>();
		
		try{
			
			getConnection();
			//처음에 첨부된 페이지가 메인이라면 첨부된 페이지의 안쪽에 들어가는 정보들은 모두 메인페이지로 보냄?
			//메인만들기

			String sql="SELECT mno, poster, title, genre, num "
					+ "FROM (SELECT mno, poster, title, genre, rownum as num "
					+ "FROM (SELECT mno, poster, title, genre "
					+ "FROM movie ORDER BY mno ASC)) "
					+ "WHERE num BETWEEN ? AND ?";
				
			
				ps=conn.prepareStatement(sql);
				int rowSize=50;
				int start=(rowSize*page)-(rowSize-1);
				int end=rowSize*page;
				
				ps.setInt(1, start);
				ps.setInt(2, end);
				
				ResultSet rs=ps.executeQuery();
				
				
				while(rs.next())
				{
					MovieBean vo=new MovieBean();
					
					vo.setMno(rs.getInt(1));
					vo.setPoster(rs.getString(2));
					vo.setTitle(rs.getString(3));
					vo.setGenre(rs.getString(4));
					
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
	
	
	//게시판
	
	public List<BoardBean> boardListData(){
		
		List<BoardBean> list=new ArrayList<BoardBean>();
		
		try{
			
			getConnection();
			String sql="SELECT no, subject, name, regdate, hit "
					+ "FROM board "
					+ "ORDER BY no DESC";
			
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
				BoardBean vo=new BoardBean();
				vo.setNo(rs.getInt(1));
				vo.setSubject(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setRegdate(rs.getDate(4));
				vo.setHit(rs.getInt(5));
				
				list.add(vo);
			}
			rs.close();
			
		}catch(Exception ex) {
			
			ex.printStackTrace();
			
		}finally{
			
			
			disConnection();
		}
		
		return list;
	}
	
	//추가하기
	public void boardInsert(BoardBean vo)
	{
		
		try{
			
			getConnection();
			
			String sql="INSERT INTO board VALUES("
					+ "(SELECT NVL(MAX(no)+1,1) FROM board),?,?,?,?,SYSDATE,0)";
			
			ps=conn.prepareStatement(sql);
			
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getSubject());
			ps.setString(3, vo.getContent());
			ps.setString(4, vo.getPwd());
			ps.executeUpdate();
			
		}catch(Exception ex)
		{
			ex.printStackTrace();
			
		}finally
		{
			
			disConnection();
			
		}
		
	}
	
	
	
}
