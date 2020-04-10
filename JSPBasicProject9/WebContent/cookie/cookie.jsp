<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 최근 방문 프로그램  => 이 브라우저에 저장됨(기본 기간은 하루, 연장 가능!, 최신순으로 출력하기! 기본적으로 5개~10개!)-->
    
<%--
	
	 저장 장소:  웹브라우저에 저장(검색어, 방문한 사이트, 상세보기 저장 ==> 장바구니)0
	동작과정:
		1) 생성단계--
			Cookie cookie = new Cookie("key","값") => Map 형식(key중복되면 안된다)
												  => 문자열만 저장이 가능
												  
								getName , getValue
												  
		2) 저장단계
			response.addCookie(cookie) =>웹브라우저에 저장됨 (서버가 읽고 출력함?!)
												  	
		3) Cookie읽기 
			Cookie[] cook = request.getCookes() => ArrayList에 담았다가 출력!
			
		4) 삭제, 저장 기간을 만들때
			1.삭제시 => setMaxAge(0) 1000분의 1초
			2.저장기간 설정시 => setMaxAge(60*60*24(하루))	
								
								
										
			*****쿠키사용법 / 블럭 사용!										  	

 --%>    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>