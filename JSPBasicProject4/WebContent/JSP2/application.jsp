<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%--
   
  	application 객체 ==> ServletContext
  	==> Servlet(server+let) let:가벼운 프로그램 => web => JSP
  		MIDlet(wml), APPlet(가벼운 응용프로그램-웹, 모바일)
   		
   		Java SE: APPLICATION(윈도우창)
   		Java EE: 기업용 환경(WEB)
   		Java ME: 모바일(not smartphone)
   		
   		
   		Servlet VS JSP
   		
   		화면이 바뀌지 않는 부분은 Servlet: 연결용
   		화면이 출력되는 부분은 JSP(VIEW): 화면UI
   		==============================
   		브라우저에서 사용자가 데이터를 전송하면 ==> 받을 수 있는 파일은 Servlet과 JSP가 있다.
   		Servlet과 JSP만 request와 response을 제공! 
   		
   		
   		데이터 전송=====> Servlet(연결)-controller ====> Java(처리)model====> JSP(출력)view
   		=======================================================> MVC구조!(재사용,확장성 good! 개발<유지보수)
   		
   		
   		application 객체
   			서버와 관련
   				1) 서버정보
   					=getServerInfo() ===> 3.1 version
   					=버전 정보 getMajorVersion(), getMinorVersion()
   				   				
   				2) 자원 정보(실제저장된 위치)
   					=getRealPath()-갤러리게시판 -> 
   				3) web.xml을 읽어서 처리 =>log파일
   					=getInitParameter()
   				
   				
   				
   
   --%>
   
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%= application.getRealPath("/jsp2/application.jsp") %>
	서버이름:<%=application.getServerInfo() %>
	Major버전정보:<%= application.getMajorVersion() %>
	Minor버전정보:<%= application.getMinorVersion() %>
	
	
<% 	
String driver=application.getInitParameter("driver");
String url=application.getInitParameter("url");
String username=application.getInitParameter("username");
String pwd=application.getInitParameter("password");
	
application.log("Driver:"+driver);
application.log("URL:"+url);
application.log("Username:"+username);
application.log("Password:"+pwd);
	
%>
	
</body>
</html>

