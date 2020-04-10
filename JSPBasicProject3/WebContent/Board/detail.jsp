<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.* "%>
   
   <!-- 값을 받을때 response -->
    <%
    
    
  	//no값과   해당 page를 dao로 전송
  	//list.jsp에서 사용자가 게시물no와 해당page 정보를 클릭한 경우 => 내용보기 detail.jsp를 열예정!
  	//사용자가 클릭한 정보no와 page정보를 getParameter로 받아 스트링으로 받고.
  	String no=request.getParameter("no");
    String strPage=request.getParameter("page");
    
    //dao생성
   	BoardDAO dao=new BoardDAO();
    
    //dao에서 요청한 vo하나를 받아오기
    //no, type => 0인경우=>조회수증가!
    
    //해당 게시물을 (BoardVO vo) 에 내용보기를 위한 dao메소드 boardDetailData()에 매개변수 게시글 넘버no와 type=0을 넣은 vo객체를 생성함! 
    // => 따라서
    BoardVO vo=dao.boardDetailData(Integer.parseInt(no),0);
    
    //vo에 저장된 데이터를 html을 이용해서 출력
    //아래
    
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<style type="text/css">

.row {
	margin: 0px auto; 
	width: 600px;	
}
h2 {
	text-align: center;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">


var i=0;
$(function(){
	
	//function delClick(){}
	//$('#delBtn') ==> document.getElementbyId('delBtn');
	//selector
	/*
		태그명  td{}		===$('td')
		id   #id{}		===$("#id명")
		class .class{}  ===$('.class명')
		
			태그와 태그 사이값 가져올때
		==> <a>bbb</a>  $('a').text()   ==> getter
		==> <a></a>     $('a').text("bbb") ===> setter => 태그 사이에 bbb넣기
		
		==> <a href="kkk" id="k"> ==> $('#k').attr("href")
		==> <input type=text id="p" value="kkk"> => $('#p').val() ==> $('#p').val("ddd") => id가 p에 값을 ddd넣어라
		
		=> <td><span>ooo</span></td>   	==>$('td>span').text() ==>ooo가져옴
										==>$('td span').text() ==>ooo가져옴
										==> $('td').text() ==> ooo가져옴
										==> $('td').html() ==> <span>ooo</span>								
		
	*/
	//JS JQUERY
	//delBtn을 눌렀을때 액션! 
	$('#delBtn').click(function(){
		
		if(i==0)
		{
			//삭제 누른경우
			$('#delBtn').val("취소");
			$('#del').show();
			i=1;
		}
		else
		{	//취소누른 경우
			$('#delBtn').val("삭제");
			$('#del').hide();
			i=0;	
		}
	});
	
	
	$('#sendBtn').click(function(){
		
		//목록으로 gogo?
		//비번맞으면
		//비번 안맞으면
		var pwd=$('#pwd').val(); //pwd id인 곳에 입력한 값 가져오기
		var no=$('#no').val();
		var page=$('#page').val();
		
		//delete.jsp에서 db 처리!하러 고고
		if(pwd=="")
		{
			$('#pwd').focus();
			return;
			
		}
		
		$.ajax({
		
			//ex) delete.jsp?no=1&pwd=1234
			//json방식 type=>전송방싱 get/post
			type:'POST',
			//보내는 곳
			url:'delete.jsp',
			//보낼것 {앞이 "변수", 뒤가 값}
			data:{"no":no,"pwd":pwd},
			//정상수행  => 1  	비정상수행 ==> 0
			// 404 , 500(소스에러) , 200(success)
			/*
				
				//연결
				open('GET','delete.jsp',callback, true)
				//보내기
				send(no=1&pwd=1234)
				
				if(req.readyState==4)
				{
						if(req.status==200)
						{
							
						}			
				}
			
			*/
			//jqeury
			success:function(res) // res는 보낸값을 받음
			{
				
				//alert(res);
				var result=res.trim();
				
				if(result==0)
				{	//비번틀림
					
					alert("비밀번호가 틀립니다.^^");
					$('#pwd').val("");
					$('#pwd').focus();
					
				}else
				{
					//비번맞음		
					//삭제되는 과정 =>이동 목록으로 =>sendredirect
					location.href="list.jsp?page="+page;
					
				}
				
			}
			//error:function(...)
			
		});
		
		
	});
	
	
	
});

</script>
</head>
<body>
	 <div class="container">
	  <h2>내용보기</h2>
	 	<div class="row">
	 		<table class="table table-hover">
	 		<tr>
	 			<th width=20% class="text-center success">번호</th>
	 			<td width=30% class="text-center"><%=vo.getNo() %></td>
	 			<th width=20% class="text-center success">작성일</th>
	 			<td width=30% class="text-center"><%= vo.getRegdate() %></td>
	 		</tr>
	 		<tr>
	 			<th width=20% class="text-center success">이름</th>
	 			<td width=30% class="text-center"><%= vo.getName() %></td>
	 			<th width=20% class="text-center success">조회수</th>
	 			<td width=30% class="text-center"><%= vo.getHit() %></td>
	 		</tr>
	 		<tr>
	 			<th width=20% class="text-center success">제목</th>
	 			<td colspan="3" class="text-left"><%= vo.getSubject() %></td>
	 		</tr>
	 		<tr>
	 			<td colspan="4" class="text-left" valign="top" height="200">
	 			<pre style="white-space: pre-wrap; background-color: white; border:none; "><%=vo.getContent() %></pre></td>
	 			<!-- 밑으로 자동으로 줄이 내려가게 만듬 white-space: pre-wrap;-->
	 		</tr>    
	 		<tr>
	 			<td colspan="4" class="text-right">
	 			<a href="reply.jsp?no=<%=vo.getNo() %>&page=<%= strPage %>" class="btn btn-xs btn-success">답변</a>
	 			<a href="update.jsp?no=<%=vo.getNo() %>&page=<%= strPage %>" class="btn btn-xs btn-primary">수정</a>
	 			<input type=button class="btn btn-xs btn-danger" id="delBtn" value="삭제">
	 			<!-- 목록은 .back을 하면안됨 - 조회수를 넣어줘야하기 때문에 취소는 back가능 -->
	 			<a href="list.jsp?page=<%= strPage %>" class="btn btn-xs btn-info">목록</a>
	 			</td>
	 		</tr>
	 		<tr id="del" style="display:none"><!-- 감추기 -->
	 		 	<td colspan="4" class="text-right">
	 		 	비밀번호:<input type=password id=pwd size=10 class="input-sm">
	 		 		  <input type=hidden id="no" value="<%=no %>">
	 		 		  <input type=hidden id="page" value="<%=strPage %>"> <!-- 삭제한 위치페이지로 돌아오기 위함 -->
	 		 		  <input type=button value="삭제" class="btn btn-sm btn-danger" id="sendBtn">
	 		 	</td>
	 		</tr>
	 		</table>
	 	</div>
	 
	 </div>
</body>
</html>