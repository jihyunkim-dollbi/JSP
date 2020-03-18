<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<style type="text/css">
.row {

	margin: 0px auto;
	width: 320px;	
}

</style>
</head>
<body>
	<div class="container">
		<h3 class="text-center">ID중복체크</h3>
			<div class="row">
				<table class="table">
					<tr>
						<td>
						입력:<input type=text name=id size=15>
							<input type="button" value="검색" class="btn btn-sm btn-primary">
						
						</td>
					</tr>
					<tr>
						<td class="text-center">사용가능한 아이디입니다.</td>
					</tr>
					<tr>
						<td class="text-center">
							<input type="button" value="확인" class="btn btn-sm btn-danger">
						</td>
					</tr>
				</table>
			
			</div>
	
	</div>
</body>
</html>