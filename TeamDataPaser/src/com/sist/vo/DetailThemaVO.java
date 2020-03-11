package com.sist.vo;

import java.util.ArrayList;

public class DetailThemaVO {
	
	//상세테마(ex.연인과함께,친구와함께,외국인과함께...)
	private String t_DetailThema;
	//테마정보(ex.가족외식,상견례,돌잔치/회갑/생일,어른과함께라면)
	private String t_Info;
	
	//테마정보를 얻은 후에 ,를 이용해 split하여 arraylist에 담을 예정!!!!!!!!! 
	private ArrayList<String> t_subInfo;
	
	
	
	
	
	public ArrayList<String> getT_subInfo() {
		return t_subInfo;
	}
	public void setT_subInfo(ArrayList<String> t_subInfo) {
		this.t_subInfo = t_subInfo;
	}
	public String getT_DetailThema() {
		return t_DetailThema;
	}
	public void setT_DetailThema(String t_DetailThema) {
		this.t_DetailThema = t_DetailThema;
	}
	public String getT_Info() {
		return t_Info;
	}
	public void setT_Info(String t_Info) {
		this.t_Info = t_Info;
	}
}