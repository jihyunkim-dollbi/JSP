<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*"%>

<jsp:useBean id="dao" class="com.sist.dao.DiaryDAO"></jsp:useBean>
    <%
    	String id=request.getParameter("id");
    	String pwd=request.getParameter("pwd");
    	
    	//dao연결
    	String res=dao.isLogin("id","pwd");
    	
    	
    	
    	
    	
    	//이동
    	if(res.equals("NOID"))
    	{
 %>
			
			<script>
				alert("아이디가 존재하지 않습니다.");
				history.back();
			</script>    		
<%
		
    	}else if(res.equals("NOPWD"))
    	{
		
   %>
			
			<script>
				alert("비밀번호가 일치하지 않습니다.\n다시 입력하세요.");
				history.back();
			</script>    		
<%
		
    		
    	}else //로그인된 상태
    	{
    		//id/name 저장해놓기
    		session.setAttribute("id", id); //세션에 저장 공유됨!
    		session.setAttribute("name", res); //클라이언트마다 한개의 공간 생성됨
    		response.sendRedirect("diary.jsp"); //로그인시 일정표로 이동!! ==> diary.jsp에서 id와 res를 갖다씀!!
    		
    	}
    	
    	
    	
    
    
    
    %>
    
    