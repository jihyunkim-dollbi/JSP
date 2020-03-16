<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.member.*"%>
    
    <!-- 메모리 할당시 한글변환이 안되므로 한글변환 반드시 필요! -->
    <%
    	try{
    		
    		request.setCharacterEncoding("UTF-8");
    		
    	}catch(Exception ex){}
    
    %>
    
<%-- 데이터가 많은 경우에 setProperty사용! class명은 앞에 페키지명까지 포함해야한다! --%>   
<jsp:useBean id="mb" class="com.sist.member.MemberBean">    
    <jsp:setProperty name="mb" property="*"/>
</jsp:useBean>    


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>전송받은 데이터 출력</h1>
	이름: <%=mb.getName() %><br>
	이름: <jsp:getProperty property="name" name="mb"/><br>
	<!-- 동일코딩! -->
	성별: <%=mb.getSex() %><br>
	주소:<%=mb.getAddr() %><br>
	전화:<%=mb.getTel() %><br>
	나이:<%= mb.getAge()%>
	
</body>
</html>