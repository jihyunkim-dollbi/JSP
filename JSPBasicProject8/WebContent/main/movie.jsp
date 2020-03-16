<%@page import="com.sist.dao.MovieBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.sist.dao.*"%>
<jsp:useBean id="dao" class="com.sist.dao.MovieDAO"/>
    
<%
	
String strPage=request.getParameter("page");
// request=>값은 main에서 넘겨준 request를 사용한 것임.
		
//값을 movie.jsp로 보내면 main에서는 값을 공유받지 못한다.
//include된 파일은 include한 파일에서 값을 공유받지만 값을 공유하지는 못한다.!!


if(strPage==null)
	strPage="1";

int curpage=Integer.parseInt(strPage);

//값 가져오기
List<MovieBean> list= dao.movieListData(curpage);


	int totalPage=dao.movieTotalPage();
	
	

%>   
 
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">

.row1 {

 margin: opx auto;
 width:960px;

}
</style>
</head>
<body>
	<h1>영화</h1>
	<p>영화 페이지입니다.</p>
	<div class="row">
	<%
		for(MovieBean mb:list)
		{
	
	%>
	 <div class="col-md-4">
      <div class="thumbnail">
        <a href="/w3images/lights.jpg" target="_blank">
          <img src="<%= mb.getPoster() %>" alt="Lights" style="width:100%">
          <div class="caption">
            <p><%= mb.getTitle() %></p>
          </div>
        </a>
      </div>
     </div>
     
    <%
    
		}
    
    %>
     
     
	</div>
	<div class="row row1">
		<a href="main.jsp?mode=1&page=<%=curpage>1?curpage-1:curpage %>" class="btn btn-sm btn-primary">이전</a>
		<%= curpage %> page / <%= totalPage %> pages
		<a href="main.jsp?mode=1&page=<%=curpage<totalPage?curpage+1:curpage%>" class="btn btn-sm btn-primary">다음</a>
	</div>
	
</body>
</html>