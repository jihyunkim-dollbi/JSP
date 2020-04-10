<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*"%>

    <jsp:useBean id="dao" class="com.sist.dao.MovieDAO"></jsp:useBean>
    
    
    <!-- 메인을 거치지 않기 때문에  한글변환을 해줘야한다.  insert_ok자체의 request를 사용할 예정이기때문에.-->
    <%
    	
    	try{
    		
    		request.setCharacterEncoding("UTF-8");
    		
    	}catch(Exception ex) {}
    
    %>
    
<!-- 사용작 입력한  값 받기!  -->    
<jsp:useBean id="vo" class="com.sist.dao.BoardBean">
	<jsp:setProperty name="vo" property="*"/>
</jsp:useBean>

<!-- dao에 모든 값을 채움! -->
<%
	dao.boardInsert(vo);

	
	//이동
	response.sendRedirect("main.jsp?mode=5");
	
	
%>
