package com.sist.dao;

//데이터빈
//페이지만 나눠 출력할 예정!
/*
 * MNO      NOT NULL NUMBER(4)      
TITLE    NOT NULL VARCHAR2(1000) 
POSTER   NOT NULL VARCHAR2(2000) 
SCORE             NUMBER(4,2)    
GENRE    NOT NULL VARCHAR2(200)  
REGDATE           VARCHAR2(200)  
TIME              VARCHAR2(50)   
GRADE             VARCHAR2(200)  
DIRECTOR          VARCHAR2(200)  
ACTOR             VARCHAR2(500)  
STORY             CLOB           
TYPE              NUMBER    
 * 
 */
public class MovieBean {

	private int mno;
	private String title;
	private String poster;
	private int type;
	private String genre;
	
	public int getMno() {
		return mno;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	
	
	
	
}
