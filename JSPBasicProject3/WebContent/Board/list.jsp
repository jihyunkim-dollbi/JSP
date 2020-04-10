<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.sist.dao.*" %>
    
<%

	//데이터  가져오기
	BoardDAO dao=new BoardDAO();

	//사용자가 요청한 페이지 받기 => 사용자가 보내준값은 모두 request로 
	//디폴트는 1페이지
	//그 다음은 다음페이지 누르...
	//page라고 변수를 사용x 내장객체이다.
	String strPage =request.getParameter("page");
	
	///디폴트 잡기
	if(strPage==null)
		strPage="1";
	
	int curpage=Integer.parseInt(strPage);
	List<BoardVO> list=dao.boardListData(curpage);
	//list에 들어간 테이터를 출력하라
	
	int count=dao.boardRowCount();
	
	int totalpages=(int)(Math.ceil(count/10.0));
	
	//현재 count 14개 
	//14~5 1페이지!
	//4~1 2페이지!
	count=count-((curpage*10)-10);
	
	
	//출력은 아래서

	
	
	
	

%>    
    
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> <!-- 4버전 -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<style type="text/css">

.row {
	margin: 0px auto; 
	width: 800px;	
}

h2 {
	text-align: center;
}

</style>
</head>
<body>
	<div class="container">
		<h2>묻고 답하기</h2>
		<div class="row">
		<table class="table">
			<tr>
				<td class="text-right">
				<a href="insert.jsp" class="btn btn-sm btn-default">새글</a></td>
			</tr>
		
		</table>
			<table class="table table-striped">
				<tr>
					<th width=10% class="text-center">번호</th>
					<th width=45% class="text-center">제목</th>
					<th width=15% class="text-center">이름</th>
					<th width=20% class="text-center">작성일</th>
					<th width=10% class="text-center">조회수</th>
				</tr>
		<%
				
					for(BoardVO vo:list)
					{
						
		%>
				<tr>
					<td width=10% class="text-center"><%= count-- %></td>
					<td width=45% class="text-left">
					
					<%
						if(vo.getGroup_tab()>0)
						{
							
							for(int i=0; i<vo.getGroup_tab();i++)
							{
								//공백띄어주기!
								out.println("&nbsp;&nbsp;");
							}
							
					%>
							<img src="icon_reply.gif">
					
					<%			
						}
					%>
					
					<%
					
					String msg="관리자가 삭제한 게시물 입니다.";
					
					if(msg.equals(vo.getSubject()))
					{
							
					%>
					
						<!-- 비활성화시킴, 링크 안되게.. -->
						<span style="color:#ededed"><%=vo.getSubject() %></span>
						
					<%			
							
					}
					else
					{
					
					%>
					
					<!-- 목록에서 제목을 클릭하면 상세보기로 넘어가도록.. -->
					<a href="detail.jsp?no=<%= vo.getNo() %>&page=<%= curpage%>"><%= vo.getSubject() %></a> <!-- 제목은 항상  -->
					
					<%
						String today=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
						if(today.equals(vo.getRegdate().toString()))
						{
						
					%>
							<sub><img src="new.gif"></sub>
					<%
					
						}
					  }
					%>
					</td>
					<td width=15% class="text-center"><%= vo.getName() %></td>
					<td width=20% class="text-center"><%= vo.getRegdate() %></td>
					<td width=10% class="text-center"><%= vo.getHit() %></td>
				</tr>
						
					<%
					
					}	
					
					%>
					
			</table>
			<table class="table">
			<tr>
				<td class="text-center">
				<a href="list.jsp?page=<%=curpage>1?curpage-1:curpage %>" class="btn btn-sm btn-default">이전</a>
				<%= curpage %> page / <%=totalpages  %> pages
				<a href="list.jsp?page=<%=curpage<totalpages?curpage+1:curpage %>" class="btn btn-sm btn-default">다음</a>	
				</td>
			</tr>
		
		  </table>	
		</div>	
	</div>
</body>
</html>