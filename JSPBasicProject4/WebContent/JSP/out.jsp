<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" buffer="16kb" %>
    
    
<!-- 

p114
    
기본객체 (내장객체)
	
1) request : 사용자 요청 정보, 사용자의 정보 ==> session생성, cookie 생성
---HttpServletRequest

2) response : 응답 정보, header 정보, ***이동 정보(페이지)(sendRedirect() => 사전에 파일크기,정보 미리 보내줘야?)
--------------------- ===========
---------------------파일 다운로드(파일명, 파일크기를 서버에 먼저 전송 => 파일 전송) 창을 띄운 다음에 파일 받겠니? 확인하고 들어옴....?   
=> 데이터 전송(header, data)
---HttpServletRequest

    
3)out 객체 : HTML을 출력하는 메모리(출력버퍼)
    
=>JSP 실행 과정           
=>		a.jsp			자바로 변경(서블릿 a_jsp.java)
-------	사용자 요청 ======> 톰캣이 파일을 가지고 온다  ==============================> 컴파일   ==> a_jsp.class  ==> 실행됨  ==> 출력버퍼에 HTML을 출력해준다 ==> 이 값을 사용자에 전송  
------------------------변경된 자바 파일이 존재 하니?(없으면  .java =>.class 만들고, 존재하면 업데이트(자바파일서블릿만(.class)수정!)=> only 한번만 자바 파일 생성)
따라서  수정되면 => 컴파일만 다시하는 것이다.
     
     
(1) 메모리에 출력 => print(), println(), getBufferSize() => 8kb, getRemaining() => 남아있는 버퍼크기 확인할때!!    
=> 개발자보다 관리자 사용 ! (메모리에는 html형태로 저장되어있고, out.println()으로 확인!)

WAS = 미들웨어 = 웹컨테이너 


4) application 객체 : 서버정보, 버전, ***로그파일 관리(log), web.xml을 제어
====================톰캣===="3.1"
(web.xml(환경설정area) 파일안에 정보 有)<... version="3.1"> ==> 3=메이저, 1=마이너

***    
5) session    
    
    =========================================================
    
    
    JSP SERVICE 메소드 => 안에 9개의 내장 객체를 갖고
    
   	클래스 안의 try ~ catch절 안에 메소드 영역에 jsp소스가 들어가게 된다!
    
    
    	가상메모리를 이용하기 때문에 속도 처리 빠름! => STS에 파일 올리지 않고 여기에 직접 올리기 GOOD!
    C:\webDev\webStudy\.metadata\.plugins\org.eclipse.wst.server.core\tmp1\wtpwebapps\JSPBasicProject3\Board
    
    C:\webDev\webStudy\.metadata\.plugins\org.eclipse.wst.server.core\tmp1\wtpwebapps ==> 안에 ROOT가 WEBCONTENT의 공간이다!!!
    
    
6) pageContext 객체 : JSP관리 => include():조립!(request공유) , forward():url기억 request유지시(자신의 파일을 덮어씀!)

7) config 객체 : web.xml

8) page = this

9) exception =>try~ catch     
    
==============================================================================


***cookie는 내장 객체가 아니다. 직접 생성해야한다. => 기간(30일간 특정 ip에서 사용가능! => 라이센스기간 etc, 최근확인페이지) 

    
    
out 객체 ===> 메모리(임시공간- 출력버퍼(html출력하기 때문에)) 관리
= 메모리에 출력(HTML, XML) => out.print(), out.println(), <%= %>
= 메모리 크기 확인: getBufferSize()
= 남아 있는 메모리 확인: getRemaining()
= 버퍼 지우기: flush(), clear() ==> JSP(autoFlush() default=> 8kb)
    
    
 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	현재 메모리 크기: <%= out.getBufferSize() %><br>
	남아있는 메모리 크기: <%= out.getRemaining() %><br>
	현재 사용중인 메모리 크기: <%= out.getBufferSize()-out.getRemaining() %><br>
	
	현재 메모리 크기: <% out.println(out.getBufferSize()); %><br>
	남아있는 메모리 크기: <% out.println(out.getRemaining()); %><br>
	현재 사용중인 메모리 크기: <% out.println(out.getBufferSize()-out.getRemaining()); %><br>

</body>
</html>



























