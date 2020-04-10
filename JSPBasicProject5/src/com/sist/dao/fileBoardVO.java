package com.sist.dao;

import java.util.*;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class fileBoardVO {

		private int no;
		private String name;
		private String subject;
		private String content;
		private String pwd;
		private Date regdate;
		private int hit;
		private String filename;
		private int filesize;
		//rownum => 다음글 이전글/ 이전페이지 다음페이지 에 사용!! rownum+1!!
		private int rownum;
		
}
