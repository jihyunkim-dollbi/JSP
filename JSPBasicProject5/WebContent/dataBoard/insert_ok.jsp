<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*, com.oreilly.servlet.multipart.*, com.oreilly.servlet.*"%>
<%@   page import="java.io.*" %>
<%

	try{
		
		request.setCharacterEncoding("UTF-8");	
		
	}catch(Exception ex){}

	
	String path="c:\\upload"; //경로
	int maxSize=100*1024*1024; //100M
	String enctype="UTF-8";
	
	//업로드기능!
	//new DefaultFileRenamePolicy() 같은 파일명일 경우 자동으로 1,2,3 ..붙여줌
	MultipartRequest mr=new MultipartRequest(request,path, maxSize,enctype, new DefaultFileRenamePolicy()); //파일받는 	

	String name=mr.getParameter("name");
	String subject=mr.getParameter("subject");
	String content=mr.getParameter("content");
	String pwd=mr.getParameter("pwd");
	
	//사용자가 보내준 파일 -> name명!
	String filename=mr.getOriginalFileName("upload");
	
	//사용자가 보내준 파일이지만 해당 폴더에 같은 파일명이 있으면 +1하여 저장해줌!(시스템에서 만들어준 네임!) => 실제 저장된 파일을 읽어옴! 
	String fn=mr.getFilesystemName("upload");
	
	
	fileBoardVO vo= new fileBoardVO();

	vo.setName(name);
	vo.setSubject(subject);
	vo.setContent(content);
	vo.setPwd(pwd);
		
	if(filename==null)
	{
		//사용자가 파일을 보내지 않음
		vo.setFilename("");
		vo.setFilesize(0);
		
		
	}else
	{
		//파일을 보냈다면
		File file=new File(path+"\\"+fn);
		
		vo.setFilename(fn);
		vo.setFilesize((int)file.length());
		
	}
	
	
	fileBoardDAO dao=new fileBoardDAO();
	
	//insert
	dao.boardInsert(vo);
	
	
	//이동
	response.sendRedirect("list.jsp");
	

%>    























