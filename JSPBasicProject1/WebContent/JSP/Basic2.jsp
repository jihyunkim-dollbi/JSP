<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info="스트립스 요소"%>

    <%--
    
    	1.스크립트릿(지역변수)
    	
    	<%
    		일반 자바 코드(메소드 안에 코딩되는 내용!main..)
    		int a =10;
    		if(a == b)
    		{  		}
    	%>
    
    	2. 표현식 : 표현식안에 ; 사용 불가능! => tag안에 위치! tr , td, <div>...
    		<%= 출력물 %>  => out.prinln(출력물)
    	
    	3. 선언식 :  메소드를 만들고 싶을때 사용!(전역변수) ===> (사용금지->자바파일로 만들어서 파일 불러들임! . ) 
    		
    		자바안에 sevice 메소드안에 입력하게됨! 따라서 우리가 입력하는 스크립트릿은 모두 메소드 영역!
    		선언식의 경우 service 메소드 밖에 입력을 가능하게 해줌! 
    	 <%! 
    	 	public int sum(int a, int b)
    	 	{
    	 		return a+b;
    	 	}
    	 %>
    	
    	
     --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

		<%
			int a=100;
		%>
		
		<h1><%= a %></h1>
</body>
</html>