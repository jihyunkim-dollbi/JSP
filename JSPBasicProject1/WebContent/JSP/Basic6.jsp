<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="java.util.*, com.sist.dao.* "%>
    
   <%
   
   List<MovieVO> list=MovieDAO.movieAllData();
   	
   
   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>
	<!-- 
	
	 <div class="col-md-4">
      <div class="thumbnail">
        <a href="/w3images/nature.jpg" target="_blank">
          <img src="/w3images/nature.jpg" alt="Nature" style="width:100%">
          <div class="caption">
            <p>Lorem ipsum donec id elit non mi porta gravida at eget metus.</p>
          </div>
        </a>
      </div>
    </div>
	
	웹프로그램 => url주소를 이용해서 값을 넘김!
	
	list.jsp?page=1
	위 파일에 page값 1을 넘겨라
	detail.jsp?page=1&no=10
				==	=
				키	값
				============>request
				request.setAttribute("page",1)
				request.setAttribute("no",10)    ==> request.getparameter("no")
													 request.getparameter("page") ==>모든 값을 request에 묶어서 톰캣이 넘겨줌!
	
	
	
	
	
	 -->
	 <div class="container">
	 	<h1 class="text-center">현재 상영 영화</h1>
	<div class="row">
		<%
			for(MovieVO vo:list)
			{
		%>		
				
	 <div class="col-md-4">
      <div class="thumbnail">
        <a href="#" target="_blank">
          <img src="<%=vo.getPoster() %>" alt="Nature" style="width:100%">
          <div class="caption">
            <p><%= vo.getTitle() %></p>
          </div>
        </a>
      </div>
    </div>
					
		<%		
			}
		
		%>
		
	</div>
	
	 </div>
</body>
</html>