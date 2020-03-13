<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- -값을 받는 곳 -->

<%

	String no=request.getParameter("no");
	int n=Integer.parseInt(no);
	
	if(n==1)
	{
		
		response.sendRedirect("reDirect.jsp");	
		
	}else
	{
			
		pageContext.forward("forward.jsp");// 흐름제어
		//
	}


%>