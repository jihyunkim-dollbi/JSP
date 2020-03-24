<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%--
    
    	JSP 액션 태그(7,8장) 
    	
    	1) <jsp:include> : 공통 영역을  다양한 파일이 점유할때 사용! => 다양한 파일을 한번에 수정 가능!! 
    		JSP 안에 특정 부분에 다른 JSP를 첨부할때 => 모듈화
    		=> pageContext.include("jsp파일명")
    		
    		a.jsp
    		b.jsp
    		
    		1)정적(데이터한개-static!)
    		a.jsp 파일 안에  ==> 소스 자체로 넣기(한개의 메소드 안 변수충돌!) => 그 후 한번에 컴파일(장점: 변수공유==> 합쳤을때 에러가 나지 않기 위해서는 한쪽에만 변수선언(다른 파일에는 에러파일)) 
    		<%@ include file="b.jsp"%>
    		ex) menu bar, footer부분 => 변수 없는 곳.
    		
    		
    		2)동적
    		a.jsp 파일 안에 ==> html파일로 각각 변환 후 (변수충돌x) => 출력! 
    		<jsp:include page="b.jsp"/>
    		
    		
    		
    	2) <jsp:forward> : request를 계속 유지하고 있을때 => MVC구조 
    	3) <jsp:useBean> : 메모리 할당
    		=> <jsp:useBean id="vo" class="com.sist.dao.MerberVO">
    						======ID명칭
    			=> MemberVO vo= new MemberVO();
    						==ID명칭 동일
    						
    	4) <jsp:setProperty> : setXxx()에 값을 채운다.
    				========
    				변수!개념!
    	(<jsp:getProperty>)
    						==> VO, DTO, Bean(JSP)
    		Bean
    			1) 데이터 관리빈 => 데이터를 모아서 관리
    							읽기/쓰기 가능 필요 ==> 읽기 getter/ 쓰기 setter
    			2) 데이터 액션빈=> 데이터에 값을 넣어준다 => VO(빈)에 값을 넣어주는 클래스
    							데이터베이스 연결 ~DAO, ~MANAGER(외부에서 가져올떄), (DAO+DAO)~ SERVICE
    						
    		=========자바 빈===========
    		public class SawonVO{
    		
    			private int sabun;
    			private String name;
    			private String dept;
    				
    				public int getSabun()
    				{
    					return sabun;
    				}
    		
    				public int setSabun(int sabun)
    				{
    					this sabun=sabun;
    				}
    		}
    	
    		=> SawonVO생성시
    		  SawonVO vo = new SawonVO();
    		  vo.setSabun(1);
    		  vo.setName("홍길동");
    		  vo.setDept("개발부");
    
    			==> JSP ACTION TAG
    				<jsp:useBean in="vo" class="SawonVO"> (=객체생성 메모리 할당)
    					<jsp:setProperty name="vo" property="sabun" value="1"/>  
    					<jsp:setProperty name="vo" property="name" value="홍길동"/>
    					<jsp:setProperty name="vo" property="dept" value="개발부"/>
    				</jsp:useBean>
    	
    			==> 다른 JSP에서 값을 보낸다
    				
    				데이터 값을 받고
    			1	String sabun = request.getParameter("sabun"); 
    			2	String name = request.getParameter("name"); 
    			3	String dept = request.getParameter("dept"); 
    				
    				처리
    			4	 SawonVO vo = new SawonVO();
    		 	5	 vo.setSabun(Interger.parseInt(sabun));
    		  	6	 vo.setName("홍길동");
    		  	7	 vo.setDept("개발부");
    
    			==> 메모리 할당시 id 값과 name값이 동일해야한다.
    			
    			1	<jsp:useBean in="vo" class="SawonVO"> (=객체생성 메모리 할당)
    					//일반적인 처리과정 
    			2		<jsp:setProperty name="vo" property="*"/>  ==> 모든 셋메소드에 getParameter()값을 자동으로 넣어준다. 
    					//보통은 사용안하는 값 채워넣기
    					//<jsp:setProperty name="vo" property="sabun" value="1"/>  
    					//<jsp:setProperty name="vo" property="name" value="홍길동"/>
    					//<jsp:setProperty name="vo" property="dept" value="개발부"/>	
    			3	</jsp:useBean>
    			
    				위의 7줄의 코딩과 아래 3줄의 코딩은 같다 => 아래가 훨씬 효율적.
    					
    				
    				
    				
    				----------------------------------
    				
    				<jsp:getProperty name="vo" property="name">
    				<===> <%= vo.getName()%>
    
     --%>
     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>