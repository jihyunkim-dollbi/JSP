<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
 <!-- 
 	1. 화면ui만들어놓기
 	2. 데이터보내기
 	2.5데이터베이스 처리
 	3. 받은 데이터 출력하기
 	
  --> 
  
  
  <%
  
  		//데이터 받는 곳(request.jsp에서보냄)
  		//문제는 한글이 넘어왔기 때문에 깨짐 => 
  		//따라서한글변환 => 오류처리 => request.setCharacterEncoding("UTF-8");
  
  	
  		try{
  			
  			request.setCharacterEncoding("UTF-8");
  			
  		}catch(Exception ex){}
  		
  		String name=request.getParameter("name");
  		String sex=request.getParameter("sex");
  		String tel1=request.getParameter("tel1");
		String[] hobby=request.getParameterValues("hobby");
		String content=request.getParameter("content");
		
		
		
  %>  
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>전송받은 데이터 출력하기</h1>
	이름: <%=name %><br>
	성별: <%=sex %><br>
	전화: <%=tel1 %><br>
	소개: <%=content %><br>
	취미: <ul>
		<%
			//체크박스가 null값일 경우 => hobby.length = null
			// try~ catch 오류처리 해줘야함!!
		try{	
			
			for(int i=0;i<hobby.length; i++)
			{
				
		%>
			<li><%= hobby[i] %></li>
		
		<%
				
			}
		}catch(Exception ex)
			{   //catch절에서 null값일 경우 처리해줌!!
		%>
			<span style="color:red">취미가 없습니다.</span>
		
		<%
			}
		%>
	
	</ul>

</body>
</html>