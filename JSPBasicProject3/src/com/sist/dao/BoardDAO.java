package com.sist.dao;


import java.util.*;
import java.sql.*;

public class BoardDAO {

	private Connection conn;
	private PreparedStatement ps;
	private final String URL="jdbc:oracle:thin:@localhost:1521:XE";
	
	//드라이버  등록
	public BoardDAO()
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
	
	/* List
	 * add(Object o)
	 * 
	 * List<BoardVO>
	 * add()
	 * 
	 */
	
	// 자바 컬렉션! 1.5이상만 사용!! 
	// 람다식... 
	// list(상위 클래스)를 사용하면 뒤에 객체 생성에서 arraylist, vector, linkedlist 모두 사용가능하다!
	// 리턴형은 list or object => 형변환 중요!
	
	
	//기능 => 목록출력
	public List<BoardVO> boardListData(int page)
	{
		
		List<BoardVO> list=new ArrayList<BoardVO>();
		
		try
		{
			
		 getConnection();
		 //인라인뷰
		 String sql="SELECT no,subject, name, regdate, hit,group_tab, num "
		 		+ "FROM (SELECT no,subject,  name, regdate, hit, group_tab, rownum as num "
		 		+ "FROM (SELECT no,subject, name, regdate, hit,group_tab "
		 		+ "FROM replyBoard ORDER BY group_id DESC, group_step ASC)) "
		 		+ "WHERE num BETWEEN ? AND ?";
			
		 // rownum은 중간에서부터 잘라낼 수 없다 => Top-N 맨위만 자르기 가능!
		 // rownum은 번호가 1번부터!! 0번 x
		 // 1~10 11~20 21~30
		 
			int rowSize=10;
			int start=(rowSize*page)-(rowSize-1);
			int end=rowSize*page;
			
		//전송준비
			
			ps=conn.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			
			ResultSet rs=ps.executeQuery();
			
			
			while(rs.next())
			{
				BoardVO vo=new BoardVO();
				
				vo.setNo(rs.getInt(1));
				vo.setSubject(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setRegdate(rs.getDate(4));
				vo.setHit(rs.getInt(5));
				vo.setGroup_tab(rs.getInt(6));
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
	
	//총페이지 구하기!!
	public int boardRowCount(){
		
		int count=0;
		try
		{
			getConnection();
			String sql="SELECT COUNT(*) FROM replyBoard";
			ps=conn.prepareStatement(sql);
			
			ResultSet rs=ps.executeQuery();
			rs.next();
			
			count=rs.getInt(1);
			rs.close();
			
			
		}catch(Exception ex)
		{
			ex.printStackTrace();
			
		}finally
		{
			
			disConnection();
		}
		
		return count;
		
	}
	
	
	public void boardInsert(BoardVO vo)
	{
		
		try
		{
			getConnection();
			String sql="INSERT INTO replyBoard(no,name,subject,content, pwd, group_id) VALUES("
					 + "rb_no_seq.nextval,?,?,?,?,(SELECT NVL(MAX(group_id)+1,1)FROM replyBoard))";
			
			ps=conn.prepareStatement(sql);

			//?에 값넣기 // 사용자로 부터 값 받은 값을 오라클에 넣기!
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getSubject());
			ps.setString(3, vo.getContent());
			ps.setString(4, vo.getPwd());
			
			//실행요청
			ps.executeUpdate();
					
			
		}catch(Exception ex)
		{
			ex.printStackTrace();
			
		}finally
		{
			disConnection();
			
		}
		
	}
	
	//내용보기(조회수증가)=> 수정하기(데이터읽기)
	//한개만 가져올 예정
	//type=1번이면 조회수 증가x
	//type=0번이면 조회수 증가o =>
	public BoardVO boardDetailData(int no, int type)   //==> 1. detail.jsp 2. update.jsp에서 사용!
	{
		BoardVO vo=new BoardVO();
		
		try
		{
			
			getConnection();
			
			String sql="";
			if(type==0) //조회수 증가 => detail.jsp
			{
				//수정,상세보기 모두 데이터 가져오기 필요!
				//상세보기시 type이 0일경우 조회수를 증가시켜줌
				sql="UPDATE replyBoard SET "
					+ "hit=hit+1 "
					+ "WHERE no=?";
				
				ps=conn.prepareStatement(sql);
				ps.setInt(1, no);
				ps.executeUpdate();
				// ps.close(); => 여러개 동시에 sql실행시 그때그떄 닫아줘야하지만 아래disc에서 한번에 닫음
			}
			
			
			//상세보기 후 수정하는 경우(는 조회수를 증가시키지 않는다.)
			//수정하기(데이터읽어오기)
			//type이 1일 경우 => update.jsp(수정!)
			sql="SELECT no,name, subject, content, regdate, hit "
				+ "FROM replyBoard "
				+ "WHERE no=?";
			
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);
			
			//데이터읽기 시작
			ResultSet rs=ps.executeQuery();	
			rs.next();
			
			//vo에 값을 저장
			vo.setNo(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setSubject(rs.getString(3));
			vo.setContent(rs.getString(4));
			vo.setRegdate(rs.getDate(5));
			vo.setHit(rs.getInt(6));
			
			rs.close();
			
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			
		}finally
		{
			
			disConnection();
		}
		
		return vo;
	}
	
	
	
	//수정
	
	public boolean boardUpdate(BoardVO vo){
		
		boolean bCheck = false;
		//true면 sendredirect로 보냄
		
		try{
			
			getConnection();
			
			String sql="SELECT pwd FROM replyBoard "
					+ "WHERE no=?";

			ps=conn.prepareStatement(sql);
			ps.setInt(1, vo.getNo());

			ResultSet rs=ps.executeQuery();
			rs.next();
			
			String db_pwd=rs.getString(1);
			rs.close();
			
			if(db_pwd.equals(vo.getPwd()))
			{
				bCheck=true;
				//디테일로 넘어가기
				sql="UPDATE replyBoard SET "
					+ "name=?, subject=?, content=? "
					+ "WHERE no=?";
				
				ps=conn.prepareStatement(sql);
				ps.setString(1, vo.getName());
				ps.setString(2, vo.getSubject());
				ps.setString(3, vo.getContent());
				ps.setInt(4, vo.getNo());
				
				//실행
				ps.executeUpdate(); //commit
				
				
			}else
			{
				
				bCheck=false;
				//비밀번호 불일치
			}
			
			
		}catch(Exception ex)
		{
			ex.printStackTrace();
			
		}finally{
			
			disConnection();
		}
		
		
		return bCheck;
		
	}
	//삭제
	//답변하기

	public void replyInsert(int pno, BoardVO vo)
	{
		try
		{
			getConnection();
			
			//오토커밋을 못한다.= 자동저장x
			conn.setAutoCommit(false);
			
			//pno가 가지고 있는.. gi gs gt 가져오기 
			String sql="SELECT group_id, group_step, group_tab "
					+ "FROM replyBoard "
					+ "WHERE no=?";
			
			ps=conn.prepareStatement(sql);
			ps.setInt(1, pno);
			
			ResultSet rs=ps.executeQuery();
			
			rs.next();
			int gi=rs.getInt(1);
			int gs=rs.getInt(2);
			int gt=rs.getInt(3);
			rs.close();
			
			//답변형 게시판 핵심쿼리
			//gi gs gt 정정해주기
			/*GS는 ASC로 SORT한다.
			 * 	  	  gi  gs   gt  depth
			 *aaa	  1    0   0	4
			 * =KKK	  1	   1   1    0
			 * =FFF	  1    2   1    0
			 * =bbb   1    3   1    1
			 * 	=ccc  1    4   2 	1
			 *   =ddd 1    5   3	0
			 *
			 *   클릭한것을 기준으로 값을 가져옴
			 *   fff가 가장 bbb보다 나중이기 때문에 FFF를 AAA 바로 밑으로 넣어주고
			 *   BBB,CCC,DDD에 GS숫자를 +1씩 해줌
			 *   
			 */
			
			//새글에 답변시 새글 아래 답변들에 gs를 sort 시켜주기!
			sql="UPDATE replyBoard SET "
				+ "group_step=group_step+1 "
				+ "WHERE group_id=? AND group_step>?";
				// ?=> gi ?=> gs
			
			ps=conn.prepareStatement(sql);
			ps.setInt(1, gi);
			ps.setInt(2, gs);
			ps.executeUpdate(); //commit이 포함되어있다.따라서,오류시 아래 쿼리들을 실행 못하도록 만들어놓아야한다. => 트랜잭션 프로그램!
			
			//데이터추가-> 답변올릴때마다 상위것에 depth 답변개수를 증가시켜줘야함!
			//+시켜줄 항목들..
			sql="INSERT INTO replyBoard(no, name,subject,content,pwd,group_id,group_step, group_tab, root) VALUES( "
					+ "rb_no_seq.nextval,?,?,?,?,?,?,?,?)";

				ps=conn.prepareStatement(sql);
				ps.setString(1, vo.getName());
				ps.setString(2, vo.getSubject());
				ps.setString(3, vo.getContent());
				ps.setString(4, vo.getPwd());
				
				ps.setInt(5, gi);
				ps.setInt(6, gs+1);
				ps.setInt(7, gt+1);
				ps.setInt(8, pno);
				
				ps.executeUpdate();
				
			//depth증가
			//root = pno를 증가시켜줌
			
				sql="UPDATE replyBoard SET "
					+ "depth=depth+1 "
					+ "WHERE no=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, pno);
				ps.executeUpdate();
				
				conn.commit();
			
		}
		catch(Exception ex)
		{
			
			ex.printStackTrace();
			//오류시 모두 처리되도록 rollback처리하도록 해야한다.(트랜잭션프로그램 => 여러개 문장을 동시에 수행할때.)
			try{
				
				conn.rollback();
				
			}catch(Exception e){}
			
		}
		finally
		{
			try{		
				//문제가 없으면 커밋하게됨!
				conn.setAutoCommit(true);

			}catch(Exception ex){}
						
			disConnection();
		}
		
	}
	
	
	public int boardDelete(int no, String pwd)
	{
		int result=0;
		
			try
			{
				getConnection();
				
				//비밀번호 검색 - 맞는지
				String sql="SELECT pwd FROM replyBoard "
						+ "WHERE no=?";
				
				ps=conn.prepareStatement(sql);
				ps.setInt(1, no);
				
				ResultSet rs= ps.executeQuery();	
				rs.next();
				
				String db_pwd=rs.getString(1);
				rs.close();
				
				if(db_pwd.equals(pwd)){
					
					//정상수행
					result=1;
					//삭제하기
					sql ="SELECT root,depth FROM replyBoard "
						+ "WHERE no=?";
					
					ps=conn.prepareStatement(sql);
					ps.setInt(1, no);
					
					rs=ps.executeQuery();
					rs.next();
					
					
					//root개시물 순서...?
					int root=rs.getInt(1);
					//삭제가능한지 안한지 확인위해
					int depth=rs.getInt(2);
					rs.close();
					
					//0댓글 없는 상태 , 1댓글 있는 상태
					if(depth==0)
					{
						sql="Delete FROM replyBoard "
							+ "WHERE no=?";
						ps=conn.prepareStatement(sql);
						ps.setInt(1, no);
						ps.executeUpdate();
						
						
						
					}else
					{
						//댓글이 있는 경우
						String msg="관리자가 삭제한 게시물 입니다.";
						
						//제목와 내용을 msg로 업데이트 할 예정!!
						sql="UPDATE replyBoard SET "
							+ "subject=?, content=? "
							+ "WHERE no=?";
						
						ps=conn.prepareStatement(sql);
						ps.setString(1, msg);
						ps.setString(2, msg);
						ps.setInt(3, no);
						ps.executeUpdate();
						
						
						sql="UPDATE replyBoard SET "
								+ "depth=depth-1 "
								+ "WHERE no=?";
						ps=conn.prepareStatement(sql);
						ps.setInt(1, root);
						ps.executeUpdate();
						
					}
					
				}else
				{
					
					
				}
				
				
				
			}catch(Exception ex)
			{
				ex.printStackTrace();
				
			}finally{
				
				disConnection();
				
			}
		
		
		
		return result;
		
		
	}
	
	
	
	
	
	
	
	
}
