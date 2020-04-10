<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// session.invalidate(); //갖고 있던 모든 세션 정보 삭제! ==> 로그아웃시
	
	session.removeAttribute("name"); //갖고 있던 name의 값만 삭제시킴! ex)pick, 장바구니에서 일부 삭제할떄!!
	response.sendRedirect("diary.jsp"); //으로 이동

	/*
	
		Session:  서버에 일부 데이터 저장해놓고 => 모든 JSP에서 공유할 목적으로 사용
		주요 기능)
		1) setAttribute(key, Object) : 세션공간에 저장할때
		2) getAttribute(key) : 저장값 가져올때
		3) getInvalidate() : 저장된 모든 데이터를 삭제할때
		4) removeAttribute() : 일부삭제, 한개씩
		5) setMaxactiveInterval() : 저장기간 설정
	
	
	*/
%>