<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*, java.util.* "%>
    <jsp:useBean id="dao" class="com.sist.dao.FoodDAO" scope="page"></jsp:useBean>
    <!--  scope 페이지 벗어나면 자동 메모리 회수 -->
    <%
    
    List<CategoryBean> list = dao.categoryListData();
    
    //쿠키읽기 =>번호로  값을 저장하고 그림하나만 가져올예정 ==> 빈이 있으니까 링크 사용 가능
    List<FoodHouseBean> fList = new ArrayList<FoodHouseBean>();
    //객체단위로 저장후 원하는 것 뽑아 사용하기
    
    //request는 브라우저를 통해 값을 읽음
    Cookie[] cookies=request.getCookies(); //보내준 번호 받음 no
    // 1 -> (food1, 1) 클릭한 번호를 저장해놓음!
    //3 ->  (food3, 3)
    //쿠키안에는 내 모든 사이트 정보가 다 들어있따
    for(int i=0; i<cookies.length;i++)
    {
    	if(cookies[i].getName().startsWith("food")) // 키"food"+no ==> food1, food2, food3으로 된 키의 값만 가져올 예정
    		{
    			String no=cookies[i].getValue(); //("food"+no, no); 의 no값!!
    			FoodHouseBean vo=dao.foodDetailData(Integer.parseInt(no)); //no에 해당하는 foodDetailData 정보를 달라
    			//다음에는startsWith("food") fodd대신에  "id"를 주고 id에 해당하는 no값을 가져오기! (로그인)
    			fList.add(vo);
    		}
    	
    }
    
    
    
    
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
	<h1 class="text-left">믿고 보는 맛집 리스트</h1>
		<div class="row">
			<%
				for(CategoryBean vo:list)
				{
			%>
				<div class="col-md-3">
					 <div class="panel panel-primary">
      					<div class="panel-heading"><%= vo.getTitle() %><br>
      					<sub><%= vo.getSubject() %></sub>
      					</div>
      					<div class="panel-body">
      					<a href="food.jsp?cateno=<%=vo.getCateno()%>"><img src="<%= vo.getPoster() %>" width=85%></a>
      					</div>
    				</div>
				</div>
			
			<%		
					
				}
			
			%>
			
			
		</div>
		<hr>
		<div class="row">
			<h3>최근 방문한 맛집</h3>
			<%
				int j=0;
				for(int i=fList.size()-1; i>=0;i--) //arraylist는 순서대로 입력되기 때문에 거꾸로 출력하여 최신에 클릭한 것을 불러옴!!  
				{
					FoodHouseBean vo=fList.get(i);
					if(j>5)
						break;
					
			%>
					 <div class="col-md-2">
    						<div class="thumbnail">
    						  <a href="detail.jsp?no=<%=vo.getNo()%>">
     						   <img src="<%= vo.getImage() %>" alt="Lights" style="width:250px; height:150px">
     					   <div class="caption">
       					   <p><%= vo.getTitle() %></p>
     					   </div>
      					</a>
   					 </div>
			 	</div>
			
			<%
					j++;
				}
			
			%>
		</div>
		
	</div>
</body>
</html>