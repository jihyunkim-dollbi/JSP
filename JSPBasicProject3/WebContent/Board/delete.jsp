<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*" %>

   <%
    	String no=request.getParameter("no");
   		String pwd=request.getParameter("pwd");
  		//출력될 내용! !
   		//System.out.println("번호:"+no+",비밀번호:"+pwd);
		  
  		
  		//dao연동
  		BoardDAO dao= new BoardDAO();
  		
  		int res=dao.boardDelete(Integer.parseInt(no), pwd);
  		
    %>
    
    
    <%=res %>
<!-- 1일 경우 자바가 모두 사라짐... -->