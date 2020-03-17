package com.sist.vo;

import java.util.ArrayList;

import com.sist.manager.*;


public class main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		
		DetailThemaVO vo = new DetailThemaVO();
		
		ThemaManager mgr = new ThemaManager();
		
		ArrayList<DetailThemaVO> list = mgr.DetailThemaAllData();
		
		try{
			
			
		
				
		for(int i=0; i<list.size(); i++)
		{
			
			list.get(i).getT_DetailThema();
			
			System.out.printf(list.get(i).getT_DetailThema() + "   ");
			
			for(int j=0; j<list.size(); j++)
			{
				
				list.get(j).getT_Info();
				
				System.out.printf(list.get(j).getT_Info());
				System.out.println();
				
			}
			
			
			
		}
		
		
		}catch(Exception ex)
		{
			
			
		}
		
		
		
		
		
		}
	
	}