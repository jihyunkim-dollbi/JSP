<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- 입력창 -->
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>
		<h2>회원가입</h2>
		<form method=post action="join_ok2.jsp"> <!-- submit버튼이 여기로 모두 데이터 전송 -->
		<table border=1 width=350>
			<tr>
				<td width=20%>이름</td> <!--여기의 name값과 vo의 변수명과 일치해야한다.-->
				<td width=80%><input type=text name=name size=15></td>
			</tr>
			<tr>
				<td width=20%>성별</td> <!--여기의 name값과 vo의 변수명과 일치해야한다.-->
				<td width=80%><input type=text name=sex size=15></td>
			</tr>
			<tr>
				<td width=20%>주소</td> <!--여기의 name값과 vo의 변수명과 일치해야한다.-->
				<td width=80%><input type=text name=addr size=15></td>
			</tr>
			<tr>
				<td width=20%>전화</td> <!--여기의 name값과 vo의 변수명과 일치해야한다.-->
				<td width=80%><input type=text name=tel size=15></td>
			</tr>
			<tr>
				<td width=20%>나이</td> <!--여기의 name값과 vo의 변수명과 일치해야한다.-->
				<td width=80%><input type=text name=age size=15></td>
			</tr>
			<tr>
			<td colspan="2" align=center>
				<button>전송</button> <!-- submit버튼과 동일 -->
				
				<!-- 
					<input type=submit>
					<input type=image>
					<button></button>
					
				 -->
			</tr>
		</table>
		</form>
	</center>
</body>
</html>