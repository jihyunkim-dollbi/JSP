<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="java.util.*, com.sist.dao.* "%>
    
    <%
   
   List<MusicVO> list=MusicDAO.musicAllData();
   	
   %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
		<h1 class="text-center">Music top-list</h1>
		<div class="row">
		
			<%
			
			 	for(MusicVO vo:list)
			 	{
			 		
			 		String title=vo.getTitle();
					String title2 ="";
			
					if(title.length()>10)		
					{
						title2=title.substring(0,10)+"...";
					}
					else
					{
						title2=title;
						
					}
			%> 		
			 
	 <div class="col-md-4">
	 
      <div class="thumbnail">
     
        <a href="#" target="_blank">
          <img src="<%=vo.getPoster() %>" alt="Nature" style="width:100%"> 
          <div class="caption">
            <p><%= title2 %></p>
            </a>
         	<p><%= vo.getSinger()%></p>
         	<p><%= vo.getAlbum()%></p>
         	<p><%= vo.getState()%></p>
          </div>
       
      </div>
    </div>
 
			<% 		
			 		
			 	}
			
			%>
		
		</div>
	
	
	</div>
</body>
</html>