<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	
	
	try{
		
		request.setCharacterEncoding("UTF-8");
		
	}catch(Exception ex) {}
	//find에서 검색경우 한글이 깨지는 이유는 main을 거져처 정보를 출력하기 때문에 main에서 한글 변환을해줘야한다.


	String mode=request.getParameter("mode");
	
	if(mode==null)
		mode="0";
	int no=Integer.parseInt(mode);

	String jsp="home.jsp";
	
	switch(no)
	{
	case 0:
		jsp="home.jsp";
		break;
	case 1:
		jsp="movie.jsp";
		break;
	case 2:
		jsp="music.jsp";
		break;
	case 3:
		jsp="find.jsp";
		break;
	case 4:
		jsp="find_ok.jsp";
		break;
	case 5:
		jsp="list.jsp";
		break;
	case 6:
		jsp="insert.jsp";
		break;

	}

%>
 
    <!-- movie는 main에 include되어있기때문에 main에서 한글인코딩을 해주어야 movie로 메인에서 한글변환에서 request값이 안전하게 전달! 
    	 main에 보낸진 정보는 music , movie, find에 모드request값이 공유된다.
		 
		 1)
		 main은 화면출력만 담당!
		  검색기능
		 
		 2)   	 	    	 
    	 db연동하여 값을 전달해야하는 경우는 _ok.jsp로 보낸다.
 		  화면출력x => _ok.jsp (게시판출력..etc)
    	 db연동!sendRedirect , forward
    -->
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> 
  <!-- JQUERY는 다른곳에 또 있으면 충돌! 결국 HTML, JS, CSS는 모두 충돌 가능성이 있다 -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<!-- 고정된 파일 : 바뀌지 않는 영역 => @  =>파일고정!-->
<%@ include file="menu.jsp" %>
      
<div class="container">
	<!--변경가능한 파일: 이 코딩은 언제든지 파일을 바꿀필요 있는 경우!! -->
	<jsp:include page="<%=jsp %>"></jsp:include>
</div>

</body>
</html>