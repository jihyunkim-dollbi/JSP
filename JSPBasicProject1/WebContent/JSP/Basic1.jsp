<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp" buffer="16kb" autoFlush="true" session="true"
    info="게시판의 목록 출력(2020.03수정)"
    %>
    
<%--

	사용자가 데이터 정송(한글) 검색 => 서버가 값을 받는다
			euc-kr				euc-kr,utf-8 
			utf-8				euc-kr(x),utf-8
							=> 요청을 처리! 
							=> 결과값 전송!
			
			파일 업로드, Ajax, React, Vue => UTF-8로 통합시켜서 처리하는게 편리.					
								
								
								
 --%>
    
<%--
	
	page 지시자 : JSP파일에 대한 정보를 가짐
				HTML(DEFAULT) OR XML
				CHARSET DEFAULT는 영문 1BYTE!
				
				1. language : java 혹은 c, c++ 가능
				contentType(변환코트):
				
				2. contentType="text/html; charset=UTF-8"
				 ==> response.setContentType("text/html; charset=UTF-8")
				 ==> default : contentType="text/html; charset=ISO-8859-1" (C코드/ 아스키코드!)
				 ==> 변환형식 
				 		HTML => text/html
				 		XML => text/xml	 
					
					**EUC-KR 중국어 일본어 깨짐 오로지 한국어만 가능!
					
				3. errorPage : error가 있는 경우에 지정한 파일로 이동!	
					 
					 errorPage="error.jsp"%> ==> forward로 errorPage지정!! url주소 변환x req값은 가지고 있음!
					 
				4. import : 라이브러리를 읽어 올 경우, 사용자정의 클래스를 읽을때.. 
					===== default : java.lang , javax.servlet.*  => 생략가능!
					***** 기본은 page 지시자의 속성(element) => 한번만 사용한다. 
						 import여러개 사용하기 위한 2가지 방버
							1. <%@ page import="java.io*, java.util.*"%> =>, 사용!
							2. <%@ page import="java.io.*"%>	=> import 만 복수 사용 가능!!
							   <%@ page import="java.util.*"%>
						
				5. buffer : 출력버퍼(메모리에 저장) (HTML을 출력하는 메모리 공간) => 8kb(8000byte) => 부족할 경우 증가시켜줘야함!!
							클라이언트 버퍼는 1개 => 같은 메모리를 갖고 지우고 다시 읽어들임  => autoFlush="true" ==> 파일이 바뀔때마다 메모리 리셋시켜줌!!
					
						
						일반DOM => 속도느림(처음부터 매번 다시 읽어들임) 
						가상DOM이용 => REACT, VUE => 부분수정가능! => 속도 빠른 기능 증가!=> 깜빡거림X
					
							
				6. session :  default=true!
				
				*** 쓰레드! 2개 동시작동 => 속도 맞추기? 
							 - html text 읽기 
							 - image 읽기
				
				7. info : 파일에 대한 정보 입력!
				
				
				
				
 --%>    
    

<%-- 주석의 종류

	html 주석 
	
	1. <!-- -->
	
	java 주석
	
	1. //
	2. /*  */
	
	<%	int b=20; %>  
	<%= //b %>
	<%= /*str*/ %> 


	JSP => JavaServer Page => 서버에서 실행되는 자바 파일
					  ====
					  web에서는 파일이라고 하지 않고 Page라 부름(일반 사이트 75개정도)	
	
	
	JSP
		1) 실행과정 a.jsp => a_jsp.java => a_jsp.class => 실행(html)만 생김
		2) 지시자 - @붙음!
		
		  	1. page 지시자: JSP파일에 대한 information has ==> 페이지 전체에 대한 정보 포괄
		  	
		  		<%@ page 속성=값, 속성=값,,,,%>
				
				(example)
			  	<%@ page language="java" contentType="text/html; charset=UTF-8"
   				 pageEncoding="UTF-8"%>
		  	
		  	2. include 지시자:JSP안에 다른 JSP 첨부(조림)
		  	
		  		<%@ include file=""%>
		  		
		  		정적 데이터 => 자바소스가 합쳐지므로 동일한 변수를 사용X
		  		자바를 합쳐줌 -> 위 방식!
		  		
		  		**
		  		값을 합쳐줌 -> 실행 결과만 묶어줌 (HTML에서 합!)위위 방식! 
		  		
		  		
		  	
		  	3. 태그 라이브러리 - 12,13장! ==> 태그로 lib 만듬!
		  	
		  		<%@ taglib prefix="" url=""%>
		  		<c:if>
		  		<c:foreach>
		  		<c:choose>
		  		<c:set>
		  		<c:out>
		  		
		3) 자바 코딩
			1. 자바코딩(자바 파일=> DB연동, VO(자바빈))
				
				<% %>  ==> 스크립트릿 - 일반 자바 코딩
				<%! %> ==> 선언식 - 멤버변수 혹은 메소드 만들때
				<%= %> ==> 표현식 - 화면 출력할때 => out.println()
			
		4) 내장객체(기본객체) : 미리 생성된 객체(new x)
			
			***
			1.request : 사용자 요청값, 사용자 정보(IP, PORT)
			***
			2.response : 서버에서 응답
			***
			3.session : 서버에 사용자정보나 기타내용 저장
			4.application : 서버정보 가짐
			5.out(메모리) : 출력 buffer에 대한 정보 가짐 => <%= %> , ${}
			***
			6.pageContext : JSP와 JSP를 연결 => include, forward
			7.page : this와 같은 개념!
			8.config : 환경 설정 => web.xml에서 설정
			9.exception : 예외처리 => try~catch
			
		
		5) 에러페이지만들기
			
			1.한번에 처리하는 방법 : page 지시자에 존재 (errorPage="이동할 페이지명")
			2.분류하여 처리 =>톰캣이 알고 있어야 한다 (web.xml)
			 404, 500 => 따로 처리!
			
		6) 액션태그
		
			<jsp:include> : 파일첨부시 
			html 과 html 합쳐줌!!
			
			<jsp:forward> : 전체가 있고 특정 안에서만 변경 가능 => 화면은 바뀌는데  url 주소가 그대로 이면 forward! 
							==> request값이 그대로 살아있음 => id값 has! 
							==> request값을(페이지 변환해도) 공유할때 사용! 매소드 안에서 doget(req,res) 생성!! => MVC 에서 많이 사용!
			
			   < --  > ***sendRedirect : 파일 자체가 바뀜 url주소 바뀜! => request가 리셋됨(매개변수) => 그전에 보내준 값이 사라짐 => 예로 id값은 사라짐!
		
							톰캣 - 서블릿, JSP 으로 ONLY 받기 가능!	
								
								1. model1 : html + 자바
								2. req로 값을 받아서 req로 값 전송! => mvc에서 자동으로값 읽음 => developed mvvp! =>분산처리!
								3. 자바 / html 나눠짐 => mv구조! 
								
								domain model - 서버 분산 처리 방식 - spring 5이상에서  권장. 
								애자일 기법! - 팀별로 별개로 개발 후 => 마지막에 통합! 
			
			<jsp:useBean> : 메모리 할당!
			***
			<jsp:setProperty> : 요청값을 한번에 받아서 자동 처리해줌 (getParameter로 각각 받을 필요x)
			
			==============여기까지 model1방식
			==============아래부터 mvc구조!
			
		7) EL, JSTL
		8) MVC 구조!
			


 --%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<H1>안녕하세요!</H1>
	<%
		int a=10/0;
	
	%>

	<%= a %>
</body>
</html>