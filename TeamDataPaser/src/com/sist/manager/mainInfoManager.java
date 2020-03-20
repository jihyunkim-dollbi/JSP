package com.sist.manager;


import java.util.ArrayList;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.sist.dao.*;
import com.sist.vo.*;
// 버릴 값은 0값으로!!

public class mainInfoManager {
	
	
	public String MediaSubString(String cutchar, String fulltitle) {
		
		String temp ="";
		/*StringTokenizer a = new StringTokenizer(str);*/
		 int i=0;
		/*while(true)
		{
			i++;
			token
			temp = fulltitle.substring(0,fulltitle.indexOf(cutchar)).trim();
			try {
				temp += fulltitle.substring(fulltitle.indexOf(cutchar,i),fulltitle.indexOf(cutchar,i+1)+1).trim();
				
			}catch(Exception ex) {
				break;
			}
		}*/
		return temp.trim();
	}
	
	
	

	
	public ArrayList<mainInfoVO> mainInfoAllData(ArrayList<AreacodeVO> areacode)
	{
		ArrayList<mainInfoVO> list = new ArrayList<mainInfoVO>();
		mainInfoVO vo;
		

		ArrayList<AreacodeVO> ac = areacode;
		int page = 1;
		int category = 1;
		/*
		 * 
	// 가게 고유번호
	private int r_No;
	// 가게 이름
	private String r_Name;
	// 가게 업종
	private String r_Type;
	// 가게 전화번호
	private String r_Tel;
	// 가게 평점
	private double r_Score;
	// 가게 평점평가 인원
	private int r_ScoreCount;
	//가게비번
	private String r_Pwd;
	//주소1
	private String r_Addr1;
	//주소2
	private String r_Addr2;
	// 가게 지역(ex.서울강남,서울강북...)
	private String r_Area;
	// 가게 세부지역(ex.가로수길,강남역...)
	private String r_AreaDetail;
		 * 
		 * 
		 */
		Element r_No;
		Element r_Name;
		Element r_Foodtype;  //자르기!!
		Element r_Tel;   
		Element r_Score;
		Element r_ScoreCount;
		Element r_Pwd;
		Element r_Addr1;
		Element r_Addr2;
		Element r_Area;
		Element r_AreaDetail;
		
		
		//System.out.println("현재 카테고리 번호 : "+ (z+1)  + ",현재페이지번호 : " + (j+1) +", 현재지역번호 : "+(i+1));
		for(int i=0; i<2; i++)   // i < ac.size()로 변경 예정! ==> 현재 두개의 area만 돌 것!!
		{
			for(int j=0; j < page; j++) // 한개의 areacode를 돌때 각 페이지 별로 자료를 가져올 예정!!  현재 0,1 페이지만 긁을 예정!!
			{
				try{
					
				//	http://www.menupan.com/restaurant/bestrest/bestrest.asp?page= 12&trec=292&areacode=ss218&pt=wk // 주간랭킹 => 안에서 페이지를 모두 돌면서 상세 페이지를 모두 읽을 예정!
				//  http://www.menupan.com/restaurant/bestrest/bestrest.asp?page=   2     &trec=292&areacode=         ss218               &pt=wk   ex) 서울 가로수길 2페이지!!!
				//  http://www.menupan.com/restaurant/bestrest/bestrest.asp?page="+(j+1)+"&trec=293&areacode="+ac.get(i).getA_AreaCode()+"&pt=wk";
				/*															ㅓ+1=1페이지!   페이지 수! 		      		지역코드!!									
				 */
					String url ="http://www.menupan.com/restaurant/bestrest/bestrest.asp?page="+(j+1)+"&trec=293&areacode="+ac.get(i).getA_AreaCode()+"&pt=wk";
					
					//지역코드 별로 페이지를 돌면서 페이지별 url정보를 얻어옴!
					Document doc = Jsoup.connect(url).get(); // 지역코드와 페이지를 돌면서 url에서 얻어놓은 각 가게 페이지에서 .get()하여 얻은 정보를 doc에 저장! => 상세정보페이지 1개!
					
					Elements link = doc.select("p.listName a");  // 한개의 상세정보에서 link라는 변수를 얻을 예정! doc 상세페이지에서  tag p의 classname 이 listName 인 값의 a tag가 갖는 값을 가져옴! 
					// System.out.println(link);
					
					// 페이지를 돌면서 z에서 상세정보를 모두 긁기!!
					for(int z=0; z < category; z++)   // z는 상세정보 가게 / 카테고리(가게) 1개 - 
					{
						
						
						//한개의 상세정보안의 모든 가게의 tag a값을 elem에 넣어놓음!
						Element elem=link.get(z); 
						
						//https://www.menupan.com/restaurant/onepage.asp?acode=D103352
						//elem이 갖고 있는 a tag값에서 href 값만 얻어와서 https://www.menupan.com에 붙임!
						// href => /restaurant/onepage.asp?acode=D103352 얻어옴!		
						
						String mLink="https://www.menupan.com"+ elem.attr("href");	 
						//mLink =>  https://www.menupan.com/restaurant/onepage.asp?acode=D103352		
						
						//mLink에서 얻은 해당 지역코드와 해당 페이지들에서 얻은 모든 상세정보 가게 페이지들의 정보를 doc2에 저장함!
						Document doc2=Jsoup.connect(mLink).get();
						
						
						vo = new mainInfoVO();
						
				
						//vo.setR_No(((z) + ((j)*kategorie) + ((i)*(page*kategorie))));
						/*       1r스캔개수  + 페이지개수*1r개수     + 지역코드개수*(페이지개수*r스캔개수)                   
					
						 */
						//가게 고유번호
						vo.setR_No(((z) + ((j)*category) + ((i)*(page*category))));
						
						//가게이름
						try {
							
							r_Name=doc2.select("span.storeName").get(0);
							vo.setR_Name(r_Name.text());
						
						}catch (Exception ex) { break;}
						
						
						/*
						 * 
						try {
								r_Foodtype = doc2.select("dl.restType dd.type").get(0);
							
								if(r_Foodtype.text().indexOf("-") != -1)   //카페/주점-카페
									vo.setR_Foodtype(r_Foodtype.text().substring(0,r_Foodtype.text().indexOf("-")));
								else
									vo.setR_Foodtype(r_Foodtype.text());
									
							}catch(Exception ex) {vo.setR_Foodtype("기타");}
						 
						 */
						
						
						//가게업종
						try{
							
							//가게 업종의 값을 읽어서 r_Type에 넣음!
							
							try {
								
								r_Foodtype = doc2.select("dl.restType dd.type").get(0);
								
								//경우1
								if(r_Foodtype.text().indexOf("-") != -1){ // -있다면!
									// "-" 글자 아에서 - 앞까지 자르고..
									vo.setR_Type(r_Foodtype.text().substring(0,r_Foodtype.text().indexOf("-")));
									
								}
								//경우2
								else if(r_Foodtype.text().indexOf("(") != -1){ // 문자열에 "(" 있다면
									// "-" 글자 아에서 ( 앞까지 자르고..
									
									try{
										// 전문뷔페(씨푸드뷔페)  ==> 뷔페
										if(r_Foodtype.text().indexOf("뷔")==2){
												
											vo.setR_Type(r_Foodtype.text().substring(3,5));
											
										}else{ // 한식(돈까스 전문) => 한식
									
											vo.setR_Type(r_Foodtype.text().substring(0,r_Foodtype.text().indexOf("(")));
										}
									
									}catch(Exception ex)
									{	
										break; }
									
								}
								//경우3  전문뷔페 =>  인덱스 2번째에 "뷔"가 있으면 => 
								else if(r_Foodtype.text().indexOf("뷔")==2){
								
									vo.setR_Type(r_Foodtype.text().substring(3,5));
									 
								}// 경우 4
								else //그 외에는..그냥 담기//?
									vo.setR_Type(r_Foodtype.text());
								
								}catch(Exception ex) {vo.setR_Type("기타");} //위에 해당되지 않으면!!
							
							
							}catch(Exception ex) {}
							//가게업종끝!!
						
						list.add(vo);
						}
					
					
					//가장 밖 try!
				}catch(Exception ex)
				{ ex.printStackTrace(); }
				
			}
			
		}
		
		return list;
	}
	
	
	
	
	
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		mainInfoManager ifm = new mainInfoManager();
		AreacodeManager am = new AreacodeManager();
		
		
		ArrayList<mainInfoVO> list = new  ArrayList<mainInfoVO>();
		
		System.out.println(ifm.MediaSubString(",", "aaa,bbb,ccc"));
		
		list = ifm.mainInfoAllData(am.AreacodeAllData());
		
		mainInfoDAO dao=mainInfoDAO.newInstance();
		
		int k=1;
		for(int i = 0 ; i < list.size() ; i++)
		{
			
			System.out.println("k="+k);
			
			try{
				
				Thread.sleep(500);
				
			}catch(Exception ex) {}	
			k++;
			
			System.out.println(list.get(i).getR_No());
			System.out.println(list.get(i).getR_Name());
			System.out.println(list.get(i).getR_Type());
			
			
		/*
			System.out.println(list.get(i).getR_Tel());
			System.out.println(list.get(i).getR_Addr1());
			System.out.println(list.get(i).getR_Addr2());
			System.out.println(list.get(i).getR_Score());
			System.out.println(list.get(i).getR_ScoreCount());		
			System.out.println(list.get(i).getR_Lowprice());
			System.out.println(list.get(i).getR_Highprice());
			System.out.println(list.get(i).getR_Opentime());
			System.out.println(list.get(i).getR_Closetime());
			System.out.println(list.get(i).getR_Holiday());
			System.out.println(list.get(i).getR_Content());
			System.out.println(list.get(i).getR_Good());
			System.out.println(list.get(i).getR_Seat());
			System.out.println(list.get(i).getR_Room());
			
			System.out.println(list.get(i).getR_Drink());
			System.out.println(list.get(i).getR_Nosmoking());
			System.out.println(list.get(i).getR_Reserve());
			System.out.println(list.get(i).getR_Restroom());
			System.out.println(list.get(i).getR_Park());
			System.out.println(list.get(i).getR_Other());
			System.out.println(list.get(i).getR_Delivery());
			System.out.println(list.get(i).getR_hit());
			System.out.println(list.get(i).getR_Start());
		*/	
			System.out.println(list.get(i).getR_Area());
			System.out.println(list.get(i).getR_AreaDetail());
			
			System.out.println();
		}
		System.out.println("save end.........");
		
		
		
		
	}

}
