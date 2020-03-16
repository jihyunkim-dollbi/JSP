<%@page import="com.sun.org.apache.bcel.internal.generic.INEG"%>
<%@page import="com.sist.dao.BoardDAO"%>
<%@page import="com.sist.dao.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- _ok 데이터 받아서 db연동 후 이동=>response! -->
   
<%

	try
	{
	
		request.setCharacterEncoding("UTF-8");
		
	}catch(Exception ex) {}
	
	String name=request.getParameter("name");
	String subject=request.getParameter("subject");
	String content=request.getParameter("content");
	String pwd=request.getParameter("pwd");
	//hidden 
	String no=request.getParameter("no");
	String strPage=request.getParameter("page");

	BoardVO vo=new BoardVO();
	vo.setNo(Integer.parseInt(no));
	vo.setName(name);
	vo.setSubject(subject);
	vo.setContent(content);
	vo.setPwd(pwd);
	
	
	//dao연결
	BoardDAO dao= new BoardDAO();
	
	//dao에서 보내준 값 받기
	boolean bCheck=dao.boardUpdate(vo);
	
	
	//이동
	if(bCheck==true)
	{
		response.sendRedirect("detail.jsp?no="+no+"&page="+strPage);	
	}
	else
	{
%>
	<script type="text/javascript">
	alert("비밀번호가 틀립니다.");
	//윈도우가 떳을때 화면으로 넘어감!!
	history.back();
	</script>
<%


		
		
	}
	
	
%>

