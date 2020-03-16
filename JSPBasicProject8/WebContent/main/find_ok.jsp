<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.sist.dao.*"%>
    <!-- 검색받은 내용을 db에서 찾아서 가져옴!
     -->
     
     <%
     
     	try{
     		
     		request.setCharacterEncoding("UTF-8");
     		
     	}catch(Exception ex) {}
     
     	//ss값 받기
     	String ss=request.getParameter("ss");
     	
     
     
     %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="row">
		<h1><%= ss %></h1>
	</div>
</body>
</html>