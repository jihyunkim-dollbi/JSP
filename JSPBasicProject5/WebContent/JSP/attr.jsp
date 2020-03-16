<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.temp.*, java.util.*"%>

<!-- 
	Attrubute
	
	attr.jsp => request를 갖고 있다 => sawonmanager에 request를 매개변수로 보내면 manager에서 list값을 받을 수있다
	=> call by reference!(배열과 클래스 only 가능! 주소) => list값을  attr.jsp로 갖고옴.
	
	all class => 메모리 할당됨!
	
	=======Attrubute======
	
	java, jsp에서 1~5에 값을 채워줌 =>주소을 읽어서 값을 채워줌
	
	request의 주소값(매게변수)로 값을 실어줌
	
	//html과 java를 분리가능하게 함.
	setAttribute()
	getAttrubute()
	
	1. request 
	2. response
	3. session
	config x
	4. pageContext
	page(this  => 값못채움)
	out x
	exception x
	5. application
	
	=======Attribute======


 -->
 
<%
	SawonManager sm =new SawonManager();

	sm.sawonAllData(request); //값이넘어옴!!
	
	List<Sawon> list=(List<Sawon>)request.getAttribute("list"); // ==> ${list} (=getAttribute())

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul>
	<%
		for(Sawon s:list){
			
		%>
			<li><%= s.getName() %>-<%=s.getDept() %></li>
		<%	
		}
	%>
	
	</ul>
</body>
</html>