package com.sist.temp;
import java.util.*;

import javax.servlet.http.HttpServletRequest;

public class SawonManager {

	public void sawonAllData(HttpServletRequest request){
		
		List<Sawon> list= new ArrayList<Sawon>();
		
		list.add(new Sawon(1, "홍길동", "영업부"));
		list.add(new Sawon(2, "심청이", "개발부"));
		list.add(new Sawon(3, "춘향이", "총무부"));
		list.add(new Sawon(4, "박문수", "기획부"));
		list.add(new Sawon(5, "이순신", "영업부"));
		
		//request추가
		//.setAttribute() => 속성추가!!- 데이터추가(맵형식) => getAttribute()에서 받는다. 
		request.setAttribute("list", list); //받아온것 외에 새로운것을 추가해서 보낼 수 있다.
		
	}
	
}
