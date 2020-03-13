<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 
	
	String name=request.getParameter("name");
	=same as above=
	String name=pageContext.getRequest.getParameter("name");    
    
    화면을 조립하거나 화면을 이동을 하되 request를 유지할 수 있게 하는 기능이 있다.
  1) 화면 조립:  include()- request 공유 가능
  2) 화면 이동 :  forward()- forward된 파일을 덮으씀으로서 파일이 변경되지 않고 내용변경만 가능하므로 기본의 정보갖고 있다.
  				덥어씌워진 페이지가 갖고 있던 request값을 그대로 사용할 수 있다.
    
 	화면이동방법
 	=HTML  => <a> <form action="">
 	=JS => location.href    => (ajax)
	=Java  =>  sendRedirect(), forward()
			1) sendRedirect() => request초기화(이전페이지정보 리셋)
			2) forward() => request 유지(내용은 바뀌지만(html덮어짐) 파일은 유지(url동일))
				
    
-->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<style type="text/css">
.container {

	border:1px solid black;
	width: 960px;
	height: 760px;
	
}
.header{
	
	
	border:1px solid red;
	width: 960px;
	height: 120px;


}

.footer {


	border:1px solid blue;
	width: 960px;
	height: 120px;

}

.container {

	border:1px solid green;
	width: 960px;
	height: 520px;


}

.col-sm-3{
	border:1px solid yellow;

}

.col-sm-9{
	border:1px solid magenta;

}
</style>
</head>
<body>
		<div class="container">
			<div class="row header">
			<%
				pageContext.include("header.jsp");
				//<jsp:include page="header.jsp"> ==> request를 공유한다.
				//메인페이지에 정보를 보내면 안에 파일들에 정보가 공유된다.
			%>
			</div>
			<div class="row content">
				 <div class="col-sm-3">
			<%
					pageContext.include("side.jsp");
			%>		
		   		</div>
		    	<div class="col-sm-9">
			<%
					pageContext.include("content.jsp");
			%>
			    </div>
		    </div>
		    <div class="row footer">
			<%
					pageContext.include("footer.jsp");
			%>
			</div>
		</div>
</body>
</html>


