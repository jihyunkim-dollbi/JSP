<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	width: 400px;
}

</style>
<script type="text/javascript">
function joinMove(){
	
	location.href="join.jsp";
	
} 

function login(){
	
	var f=document.frm; // form의 name값을 가져오는 법. // JS => $('form')  jquery 내가 원하는 tag를 가져올때!
		// frm안에 모든 값을 넣어 놓음
	
	var id=f.id.value; //id에 입력한 값 가져옴
	if(id.trim()=="") //id 공란이면 포커스!
	{	
		f.id.focus();
		return;
	}
	
	
	var pwd=f.pwd.value; //pwd에 입력한 값 가져옴
	if(pwd.trim()=="") // pwd공란이면 포커스!
	{	
		f.pwd.focus();
		return;
	}
	
	//입력 됨
	
	f.submit(); 
	//값을 전송 -==> action="login_ok.jsp" 로  고고!!
	
	//taost!
	
}
</script>
</head>
<body>
	<div class="container">
		<h1 class="text-center">Login</h1>
		<div class="row">
		 <form method="post" name="frm" action="login_ok.jsp">
			<table class="table table-hover">
				<tr>
					<th class="text-right success" >ID</th>
					<td><input type=text name=id size=15 class="input-sm"></td>
				</tr>
				<tr>
					<th class="text-right success" >Password</th>
					<td><input type=password name=pwd size=15 class="input-sm"></td>
				</tr>
				<tr>
					<td colspan="2" class="text-center">
					<input type=button value="로그인" class="btn btn-sm btn-danger" onclick="login()">
					<input type=button value="회원가입" class="btn btn-sm btn-primary" onclick="joinMove()">
					</td>
				</tr>
			</table>
			</form>
		</div>
	</div>
</body>
</html>















