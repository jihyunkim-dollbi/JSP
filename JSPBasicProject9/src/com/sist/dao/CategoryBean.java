package com.sist.dao;
/*
 * CATENO  NOT NULL NUMBER        
TITLE   NOT NULL VARCHAR2(500) 
SUBJECT NOT NULL VARCHAR2(500) 
POSTER  NOT NULL VARCHAR2(500) 
LINK    NOT NULL VARCHAR2(500) 
 * 
 */

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CategoryBean {

		private int cateno;
		private String title;
		private String subject;
		private String poster;
		private String link;
		
		
		
}
