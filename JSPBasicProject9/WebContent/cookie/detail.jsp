<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*, java.util.* "%>
   
   
    
    <!-- 데이터 가지러  DAO로 고고씽 -->
    
    <jsp:useBean id="dao" class="com.sist.dao.FoodDAO"></jsp:useBean>
   <%
   		String no=request.getParameter("no");
   		FoodHouseBean vo=dao.foodDetailData(Integer.parseInt(no));
   		
   		// 클릭한 페이지에서 쿠키를 저장한다!!!
   		// 그 후에 쿠키를 출력할 페이지에서 쿠키값을 받아 처리!!
   		
   		//로그인에 관계없이 브라우저에서 쿠키 저장하도록 => 키 / 값(번호로 db연동후 가져오기)
   		Cookie cookie=new Cookie("food"+no, no);
   		//쿠키 생성
   		
   		//언제까지?
   		cookie.setMaxAge(60*60*24);
   		
   		//클라이언트 브라우저에 보내주기
   		response.addCookie(cookie); 
   		
   		// 쿠키 출력하러 고고 => category.jsp
   		
   		
   		
   		
   %>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable(<%=vo.getTag()%>);

        var options = {
          title: '리뷰 통계',
          is3D: true,
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
        chart.draw(data, options);
      }
    </script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-8">
				<table class="table">
					<tr>
				<%
						StringTokenizer st=new StringTokenizer(vo.getImage(),"^");
					while(st.hasMoreTokens())
					{
				%>
					
						<td class="text-center"><img src="<%=st.nextToken()%>" width=98%></td><!-- 100% => td에 공간을 꽉 채우라는 의미 -->
					
				<%	
	
					}
					
				%>
					</tr>
					<tr>
						<td class="text-center" colspan="5">
							<h3><%=vo.getTitle() %>&nbsp; <span style="color:#FC6"><%=vo.getScore() %></span></h3>
						
						</td>
					
					</tr>
					<tr>
						<td class="text-right" width=15%>주소</td>
						<td colspan="4">
						
						<%
						
							String temp= vo.getAddress();
						
							System.out.println(temp);
							String a1=temp.substring(0, temp.indexOf("지"));
							String a2=temp.substring(temp.indexOf("지")+3);
							
						
						%>
						
						<%=a1 %><br>
						<sub style="color:gray"><%=a2 %></sub>
						
						</td>
					</tr>
					<tr>
						<td class="text-right" width=15%>전화번호</td>
						<td colspan="4"><%= vo.getTel() %></td>
					</tr>
					<tr>
						<td class="text-right" width=15%>음식종류</td>
						<td colspan="4"><%= vo.getType() %></td>
					</tr>
					<tr>
						<td class="text-right" width=15%>가격대</td>
						<td colspan="4"><%= vo.getPrice() %></td>
					</tr>
					<tr>
						<td class="text-center" colspan="5">
							<div id="piechart_3d" style="width: 900px; height: 500px;"></div>
						</td>
					
					</tr>
					<tr>
						<td class="text-right" colspan="5">
							<a href="#" class="btn btn-sm btn-danger">찜</a>
							<a href="#" class="btn btn-sm btn-success">예약</a>
							<a href="category.jsp" class="btn btn-sm btn-info">목록</a>
						</td>
					
					</tr>
				</table>
				
				
			</div>
			<div class="col-md-4">
			
			</div>
		</div>
	</div> 

	 
</body>
</html>