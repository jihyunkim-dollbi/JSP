<%@page import="com.sist.dao.BoardDAO"%>
<%@page import="com.sist.dao.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 화면출력x 

insert가 되면 list.jsp로 가라! 고 코딩-->

<%
	//데이터 받기
	try{
		
		request.setCharacterEncoding("UTF-8");	
		
	}catch(Exception ex)
	{
	
	}

	String name=request.getParameter("name");
	String subject=request.getParameter("subject");
	String content=request.getParameter("content");
	String pwd=request.getParameter("pwd");

	BoardVO vo=new BoardVO();
	vo.setName(name);
	vo.setSubject(subject);
	vo.setContent(content);
	vo.setPwd(pwd);
	
	
	// DAO연결 CNTR+SPAVE => IMPORT
	BoardDAO dao=new BoardDAO();
	dao.boardInsert(vo);
	
	
	// 이동 => 목록(list.jsp) 응답
	response.sendRedirect("list.jsp"); //여기로 이동
%>