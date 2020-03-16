<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.io.*, java.net.*"%>

<!-- get방식은 톰캣 63번 에서 해줌!!
	post방식은 해줘야한다. ==>setCharacterEncoding() -->

<%
    
	//값 받기
	String fn=request.getParameter("fn");    	
    	
	//헤더는 사용자에게  먼저보내줄때, 이 파일을 저장할것니까? 물음에 파일명과 크기을 준다! => 다운로드 창 띄워줌(attachment;) => 확인버튼 후 데이터 전송!!!
    //내용물은 아직 안들어간 상태
	response.setHeader("content-Disposition", "attachment;filename="
    					+URLEncoder.encode(fn, "UTF-8"));
    
	
	
	File file=new File("c:\\upload\\"+fn);
	response.setContentLength((int)file.length());
	
	
	// 카피해서 실제로 저장되도록
	try{
		
		//이 파일을 읽어오겠다
		BufferedInputStream bis=new BufferedInputStream(new FileInputStream(file));	
		
		//응답
		BufferedOutputStream bos=new BufferedOutputStream(response.getOutputStream());	
		
		int i=0;
		byte[] buffer=new byte[1024];
		//한번에x나눠서 전송해야.
		//tcp
		//끝나기 전단계까지 가져와야함
		
		//i가 총크기?
		while((i=bis.read(buffer, 0, 1024))!=-1)
		{
			bos.write(buffer, 0, i);
			
		}
		out.clear();
		//out의 원래 용도ㄴ는 출력! => 다시 원상복귀해줌! 원래 객체를 초기화시켜줌!!
		out=pageContext.pushBody();
		
		bis.close();
		bos.close();
		
		
	}catch(Exception ex){}
	
	
%>