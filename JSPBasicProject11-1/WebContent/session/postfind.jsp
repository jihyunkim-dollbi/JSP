<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.sist.dao.*"%>
    <jsp:useBean id="dao" class="com.sist.dao.DiaryDAO"></jsp:useBean>
    <%
    	try
    	{	
    		request.setCharacterEncoding("UTF-8");
    
    	}catch(Exception ex) {}
    
    	String dong=request.getParameter("dong"); // '연남'검색한 값을 여기서 다시 받음!!
    	//시작하자마자 값이 들어오지  않기 때문에 null값일 경우 처리를 해줘야한다.!!
    	
    	    
    	List<ZipcodeBean> list=null; //값을 받아옴 // 맨처음 창을 띄웠을때 값이 null
    	
    	if(dong!=null) //null일때 출력하지마라.
    	{
    		list=dao.postfind(dong); //값이 있을때만 db를 연동해라.
    		
    	}
    	
    
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<style type="text/css">
.row {

	margin: 0px auto;
	width: 430px;	
}
td {
	
	font-size: 8pt;

}

</style>
<script type="text/javascript">
function postfind(){
	
	var dong=document.frm.dong.value;
	if(dong.trim()=="")
	{
		document.frm.dong.focus();
		return;
		
	}	
	document.frm.submit(); //frm에 데이터 넘김!! ==> getParameter()받고 => dao로 전송!
}
function ok(zip,addr){ //변수명만 설정가능!!!

	//매개변수로 값을 받아서 join.jsp로 보낼예정!
	
	opener.frm.post1.value=zip.substring(0,3);
	//창띄운 객체 =join.jsp에 값을 채워라
	opener.frm.post2.value=zip.substring(4,7);
	opener.frm.addr1.value=addr;

	self.close(); //윈도창 닫기!
}
</script>
</head>
<body>
	<div class="container">
		<h3 class="text-center">우편번호 검색</h3>
		<div class="row">
			<form method="post" action="postfind.jsp" name="frm">
			<table class="table">
				<tr>
					<td>
					입력:<input type=text name=dong size=15 class="input-sm" value="<%=dong!=null?dong:""%>">
					<input type=button value="검색" class="btn btn-sm btn-primary" onclick="postfind()">
					</td>	
				</tr>
				<tr>
					<td class="text-right">
						<sub><font color="red">*동/읍/면을 입력하세요</font></sub>
					</td>
				</tr>
			</table>
			</form>
			<%
				if(list!=null && list.size()>0)
				{
			%>
					<table class="table table-hover">
						<tr>
							<th width=20% class="text-center">우편번호</th>
							<th width=80% class="text-center">주소</th>
						</tr>
						
						<%
							for(ZipcodeBean vo:list)
							{
						%>
								<tr>
									<td width=20% class="text-center"><%= vo.getZipcode() %></td>
									<td width=80% ><a href="javascript:ok('<%= vo.getZipcode() %>','<%= vo.getAddress()%>')"><%= vo.getAddress()%></a></td> <!--javascript:ok()  -->
								</tr>
						<%		
								
							}
						
						%>
						
						
					</table>
			<%		
					
					
				}
			%>
			
		</div>
	</div>
</body>
</html>