<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>

<%--
		
	session: 서버에서 사용자의 일부 정보를 저장
			=>HttpSession (각 클라이언트마다 1개 배정) ==> request를 이용해서 session을 언어온다.
			=>관련된 메소드(기능)
			
					key:  스트링
				1) 저장 ==============================> setAttribute(key, 값) 
																		== Object(모아서arraylist 저장 가능) - 리턴형: 리스트 가능
											Cookie cookie = new Cookie(key, 값)
																			== String
				2) 저장된 읽기 ==========================> getAttribute("key") => 단점, 반드시 형변환시켜야함(리턴형이 object이기 때문에 string을 가져오면 형변환 필요)
																		==> (제네릭스가 존재하지 않는다)					
				3) 기간 설정(+연장기능/ 기간변경) : =========> default(30분) => 초(1800)
											setMaxactiveInterval(60)=> 60초!후에 사라짐
				4) 저장된 내용 삭제(세션삭제)
					= 한개를 삭제 ==> 장바구니(결제하면 삭제) removeAttrbute("key")
					= 전체를 삭제 ==> 로그인 일부 정보 --> 로그아웃시 정보 삭제  invalidate()
					
				==================Cookie(본인 컴퓨터)/Session(접속한 서버)=================> 데이터 임시저장 기능!(저장공간 다름: 컴퓨터 or 서버)	
				
				로그인 -> 정보 선택을 해야 세션에 저장됨!  세션도 마찬가지로 저장공간. 
				선택한 파일을  옆에 저장해놓으면서(세션저장파일- 데이터 받는 파일)(따로 화면 출력) 그 정보에 해당하는 연장 데이터를 보여줌!
							
				
																		=> REQUEST, SESSION
				클라이언트(데이터전송) ==> Controller(servlet) -> Model(java) -> View(JSP)
				
				<세션> 
				로그인시 id를 기억해 정보를 얻기 위함!	
				정해진 기간동안 모든 JSP에서 저장한 정보를 가져다 사용 가능!		
				위치 탐색..
				로그인한 사람 -  댓글 바로 쓰기 가능
				비로그인한 유저 - 댓글창에 로그인 하시오 문구
				
				
 --%> 
 <%
 
 	Date date=new Date();
 	
 	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-M-d"); // 0을 붙이면 8진법으로 바뀌기 때문에 1자리수일때 0을 붙이지 않는 형식으로.
 	String today= sdf.format(date);
 	
 	StringTokenizer st=new StringTokenizer(today, "-");
 	
 	String strYear=st.nextToken();
 	String strMonth=st.nextToken();
 	String strDay=st.nextToken();
 	
 	String sy=request.getParameter("year"); //사용자 선택경우 값 넘길 예정
 	if(sy==null)
 		sy=strYear; // 디폴트값
 	String sm=request.getParameter("month"); //사용자 선택경우 값 넘길 예정
 	if(sm==null)
 		sm=strMonth;  // 디폴트값
 	
 	int year=Integer.parseInt(sy);
 	int month=Integer.parseInt(sm);
 	int day=Integer.parseInt(strDay);
 	
 	//달력 프로그램은 일자는 변경이 되는게 아니다.
 	//월과 년만 변경이 되야한다.
 	
 	
 	//해당 월에 시작 요일이 언제인지 알아야한다.
 	//1일자의 요일을 구해오는 것이 필요!
 	//실시간으로 값을 업데이트해줘야함. 실시간자리/매진/ 시간정보
 	//영화/ 영화관/날짜/시간/ etc마다 jsp를 따로 만들어서 session에 저장 => 단점, 취소가 어려움
 	//ajax로 취소, 수정 쉬워짐
 	
 	//codeMix 3 CI
 	
 	
 	//요청한 연도의 1일자의 요일이 필요함
 	// 1년도 1월 1일 ~2019년도 12월 31일까지 ==> 총 날수를 구함
 	
 	
 	int total=(year-1)*365
 			+(year-1)/4
 			-(year-1)/100
 			+(year)/400;
 	
 	//2020년도 2월 29일까지 ==> 전달까지 구하기
 	int[] lastDay={31,28,31,30,31,30,31,31,30,31,30,31};
 	
 	
 	if((year%4==0 & year%100 != 0 ) || (year%400==0))
 			lastDay[1]=29;
 	else 
 			lastDay[1]=28;
 	
 	for(int i=0;i<month-1; i++) //전달 그후 +1하면 이번달
 	{
 		//전년도합+전달합을 구하면 이번달 나옴
 		total+=lastDay[i];
 		
 	}
 	total++; //1일자를 구함
 	
 	int week=total%7; // 각달의 1일자 요일 구하기 완료
 	
 	String[] strWeek={"일","월","화","수","목","금","토"};
 	
 	
 	
 %>   
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
.row {

	margin:0px auto;
	width: 900px;
}

</style>
<script type="text/javascript">
function change(){
	
	var f=document.frm;
	f.submit();
	
}

</script>

</head>
<body>
	<div class="container">
		<h1 class="text-center"><%=session.getAttribute("name")%>(<%=session.getAttribute("id") %>)&nbsp;<%=sy %>년 <%=sm %>월  일정</h1>
		<div class="row">
			<form method="post" name="frm" action="diary.jsp">
		 	<table class="table">
		 		<tr>
		 			<td class="text-left">
		 				<select name="year" onchange="change()">
		 					<%
		 						for(int i=2020; i<2030;i++)
		 						{
		 					%>	
		 							<option <%=i==year?"selected":"" %>><%=i %></option>
		 					<%		
		 							
		 						}
		 					
		 					%>
		 				</select>년도&nbsp;
		 				<select name="month" onchange="change()">
		 				
		 				<%
		 					for(int i=1; i<=12; i++)
		 					{
		 				%>
		 						<option<%=i==month?"selected":"" %>><%= i%></option>
		 				<%		
		 						
		 					}
		 				
		 				%>
		 				
		 				
		 				</select>월
		 			</td>
		 		</tr>
		 	</table>
			<table class="table table-bordered">
				<tr class="danger" height="35">
					<%
						String color="";
						int k=0;
						for(String s:strWeek)
						{
							
							if(k==0)
							color="red";
							else if(k==6)
								color="blue";
							else
								color="black";
							
					%>
						<th class="text-center"><h2><font color="<%=color%>"><%= s %></h2></th>
					
					<%		
						k++;
	
						}
					
					%>				
				</tr>
				<%
					color="black";
					for(int i=1; i<=lastDay[month-1];i++) // 
					{
						
						if(week==0)
							color="red";
						else if(week==6)
							color="blue";
						else
							color="black";
						
						if(i==1) //첫번째줄
						{
				%>
						<tr>
						
						<%
							for(int j=0; j< week; j++) // 빈공백  &nbsp;
							{
						%>
								<td height="100" class="text-left"  valign="top">&nbsp;</td>
						
						<%		
								
							}
							
						
						%>
				
				<%			
							
						}
						
						String back="white";
						if(i==day)
							back="success";
						
				 %>
				 			<td height="140" class="text-left <%=back%>"  valign="top"><h4><font color="<%= color%>">
				 			<a href="diary_insert.jsp"><%=i %></a> <!-- 날짜 출력!!! -->
				 			</font></h4></td>
				 
				 <%		
				 		week++;
				 		if(week>6) //다음줄로 내려야함 0~6
				 		{
				 			week=0;
				 			
				 %>
				 			</tr>
				 			<tr>
				 			
				 			
				 <%			
				 			
				 		}
						
					}
				
				%>
				</tr>
			</table>
		</form>
		</div>
	</div>
</body>
</html>

