package com.sist.temp;

import java.lang.reflect.Method;
import java.util.Scanner;

public class main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		try{
			
			Scanner scan = new Scanner(System.in);
			
			System.out.println("입력:");
			
			
			Class acls=Class.forName("com.sist.temp.A"); // 리플랙션  - 패키지 단위로 객체 생성
			//패키지만 찾으면 그 안에 모든 클래스 메소드 사용 가능!!
			
			
			//A a= (A)acls.newInstance();
			// a.display();
			
			Object obj = acls.newInstance();
			Method[] m=acls.getDeclaredMethods();
			m[0].invoke(obj, null); //메소드 이름을 몰라도 찾아온다!
			//배열에 어떤 매소드가 들어올지 모른다 ==> 어노테이션(원하는 내용을 찾기 쉽도록 메소드와 클래스를 구분하는 프로그램!)을 지정하여 어떤 메소드를 불러올지 지정해줌
			/*
			 * method => 메소드 찾기
			 * type => 클래스 찾기
			 * parameter => 매개변수 찾기
			 * 
			 */
			
		}catch(Exception ex){}
		
		
		
	}

}
