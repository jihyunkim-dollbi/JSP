package com.sist.manager;

import java.util.ArrayList;

import com.sist.vo.DetailThemaVO;
import java.util.*;
import com.sist.vo.*;

public class AreacodeManager {

	
	
	public ArrayList<AreacodeVO> AreacodeAllData() {
	
		
		ArrayList<AreacodeVO> list = new ArrayList<AreacodeVO>();
		
		
		String[][] areaDetail = new String[15][];
		String[] area = {"���� ����|ss","���� ����|sn","��� ����|cs","��� �Ϻ�|cn","��õ|ic","�λ�|bs","�뱸|dg","����|gj","����|dj","���|us","����|gw","��û|cc","���|gs","����|jl","����|jj"};
		
		//gs203 : ����  �̷����� �ڵ尡 �ּҵڿ� �پ� ���� 
		
		
		areaDetail[0]= new String[18];
		areaDetail[1]= new String[24];
		areaDetail[2]= new String[20];
		areaDetail[3]= new String[7];
		areaDetail[4]= new String[5];
		areaDetail[5]= new String[5];
		areaDetail[6]= new String[6];
		areaDetail[7]= new String[4];
		areaDetail[8]= new String[3];
		areaDetail[9]= new String[1];
		areaDetail[10]= new String[10];
		areaDetail[11]= new String[15];
		areaDetail[12]= new String[10];
		areaDetail[13]= new String[10];
		areaDetail[14]= new String[10];
			
		//���ﰭ��
		areaDetail[0][0]= "������"; 
		areaDetail[0][1]= "����/�Ÿ�"; 
		areaDetail[0][2]= "����"; 
		areaDetail[0][3]= "��/����"; 
		areaDetail[0][4]= "����/��������"; 
		areaDetail[0][5]= "���/���"; 
		areaDetail[0][6]= "����/����"; 
		areaDetail[0][7]= "���/��õ"; 
		areaDetail[0][8]= "�ų���/��������"; 
		areaDetail[0][9]= "�Ż�/���"; 
		areaDetail[0][10]= "�б���/û��"; 
		areaDetail[0][11]= "����/����"; 
		areaDetail[0][12]= "����/�Ｚ/��ġ"; 
		areaDetail[0][13]= "����"; 
		areaDetail[0][14]= "������/���ǵ�"; 
		areaDetail[0][15]= "õȣ/����"; 
		areaDetail[0][16]= "�뷮��"; 
		areaDetail[0][17]= "���μ���"; 
		
		//���ﰭ��
		areaDetail[1][0]= "����/�Ǵ��Ա�"; 
		areaDetail[1][1]= "��ȭ��/��û"; 
		areaDetail[1][2]= "���/����/�̾�"; 
		areaDetail[1][3]= "���з�"; 
		areaDetail[1][4]= "���빮"; 
		areaDetail[1][5]= "����"; 
		areaDetail[1][6]= "��"; 
		areaDetail[1][7]= "��û��"; 
		areaDetail[1][8]= "����/����"; 
		areaDetail[1][9]= "����"; 
		areaDetail[1][10]= "����/�̴�"; 
		areaDetail[1][11]= "���¿�/�ѳ���"; 
		areaDetail[1][12]= "����/�λ絿"; 
		areaDetail[1][13]= "�湫��/�Ŵ絿"; 
		areaDetail[1][14]= "ȫ��/���/����"; 
		areaDetail[1][15]= "�Ⱦ�/���";
		areaDetail[1][16]= "����/���￪"; 
		areaDetail[1][17]= "�ξϵ�/��â��"; 
		areaDetail[1][18]= "����/�溹��"; 
		areaDetail[1][19]= "���̵�/���"; 
		areaDetail[1][20]= "ȸ��"; 
		areaDetail[1][21]= "������/����"; 
		areaDetail[1][22]= "���"; 
		areaDetail[1][23]= "���ų�/�ұ�"; 
	
		//��Ⳳ��
		areaDetail[2][0]= "��õ"; 
		areaDetail[2][1]= "����"; 
		areaDetail[2][2]= "��ź/����"; 
		areaDetail[2][3]= "��õ"; 
		areaDetail[2][4]= "�д�/����/�Ǳ�"; 
		areaDetail[2][5]= "����"; 
		areaDetail[2][6]= "�Ȼ�"; 
		areaDetail[2][7]= "�ȼ�"; 
		areaDetail[2][8]= "�Ⱦ�/����/�ǿ�"; 
		areaDetail[2][9]= "����"; 
		areaDetail[2][10]= "����"; 
		areaDetail[2][11]= "����"; 
		areaDetail[2][12]= "����/����"; 
		areaDetail[2][13]= "��õ"; 
		areaDetail[2][14]= "�ϳ�"; 
		areaDetail[2][15]= "ȭ��"; 
		areaDetail[2][16]= "����"; 
		areaDetail[2][17]= "����"; 
		areaDetail[2][18]= "���̵�"; 
		areaDetail[2][19]= "����"; 				

		//���Ϻ�
		areaDetail[3][0]= "������"; 				
		areaDetail[3][1]= "�ϻ�"; 				
		areaDetail[3][2]= "����"; 				
		areaDetail[3][3]= "��õ/����õ"; 				
		areaDetail[3][4]= "������"; 				
		areaDetail[3][5]= "����"; 				
		areaDetail[3][6]= "����"; 				

		//��õ
		areaDetail[4][0]= "����/������"; 				
		areaDetail[4][1]= "����/�߱�"; 				
		areaDetail[4][2]= "����/��籸"; 				
		areaDetail[4][3]= "������/�۵�"; 				
		areaDetail[4][4]= "��ȭ��"; 				
		
		//�λ�
		areaDetail[5][0]= "���ȸ�/�漺��"; 				
		areaDetail[5][1]= "����/����/�߱�"; 				
		areaDetail[5][2]= "����/�λ��"; 	
		areaDetail[5][3]= "����/�λ���"; 	
		areaDetail[5][4]= "�ؿ��/����"; 	

		//�뱸
		areaDetail[6][0]= "��â"; 
		areaDetail[6][1]= "�޼���/����"; 
		areaDetail[6][2]= "����"; 
		areaDetail[6][3]= "������/�߱�"; 
		areaDetail[6][4]= "������"; 
		areaDetail[6][5]= "ĥ��/�ϱ�/����"; 

		//����
		areaDetail[7][0]= "���걸"; 
		areaDetail[7][1]= "����/����"; 
		areaDetail[7][2]= "�ϱ�"; 
		areaDetail[7][3]= "����"; 

		//����
		areaDetail[8][0]= "����/�����"; 
		areaDetail[8][1]= "������"; 
		areaDetail[8][2]= "�߱�"; 

		
		//���
		areaDetail[9][0]= "���"; 
	
		//����
		areaDetail[10][0]= "����"; 
		areaDetail[10][1]= "����"; 
		areaDetail[10][2]= "���"; 
		areaDetail[10][3]= "����"; 
		areaDetail[10][4]= "��õ"; 
		areaDetail[10][5]= "��â"; 
		areaDetail[10][6]= "ȫõ"; 
		areaDetail[10][7]= "����"; 
		areaDetail[10][8]= "�¹�/����"; 
		areaDetail[10][9]= "��ô"; 

		// ��û
		areaDetail[11][0]= "����"; 
		areaDetail[11][1]= "�ܾ�"; 
		areaDetail[11][2]= "����"; 
		areaDetail[11][3]= "�ƻ�"; 
		areaDetail[11][4]= "õ������"; 
		areaDetail[11][5]= "û��"; 
		areaDetail[11][6]= "����"; 
		areaDetail[11][7]= "�¾�"; 
		areaDetail[11][8]= "�ο�"; 
		areaDetail[11][9]= "õ��-��������"; 
		areaDetail[11][10]= "õ��-����/����"; 
		areaDetail[11][11]= "õ��-�Ҵ�/�ֿ�"; 
		areaDetail[11][12]= "õ��-��ȯ/����"; 
		areaDetail[11][13]= "õ��-�ź�/�ȼ�"; 
		areaDetail[11][14]= "��õ"; 

		//���
		areaDetail[12][0]= "����"; 
		areaDetail[12][1]= "����"; 
		areaDetail[12][2]= "����"; 
		areaDetail[12][3]= "�ȵ�"; 
		areaDetail[12][4]= "����"; 
		areaDetail[12][5]= "����"; 
		areaDetail[12][6]= "â��"; 
		areaDetail[12][7]= "�뿵"; 
		areaDetail[12][8]= "����"; 
		areaDetail[12][9]= "����"; 

		//����
		areaDetail[13][0]= "����"; 
		areaDetail[13][1]= "����/�ξ�"; 
		areaDetail[13][2]= "���"; 
		areaDetail[13][3]= "����"; 
		areaDetail[13][4]= "��õ"; 
		areaDetail[13][5]= "����"; 
		areaDetail[13][6]= "����"; 
		areaDetail[13][7]= "����"; 
		areaDetail[13][8]= "����"; 
		areaDetail[13][9]= "�ͻ�"; 

		//����
		areaDetail[14][0]= "���ֵ�����"; 
		areaDetail[14][1]= "����/ȭ��"; 
		areaDetail[14][2]= "�������ó�"; 
		areaDetail[14][3]= "����/�쵵"; 
		areaDetail[14][4]= "�ֿ�"; 
		areaDetail[14][5]= "����/�Դ�/���"; 
		areaDetail[14][6]= "���ֽó�"; 
		areaDetail[14][7]= "�߹�"; 
		areaDetail[14][8]= "ǥ��/����"; 
		areaDetail[14][9]= "�Ѹ�/�Ѱ�"; 
				
	
		for(int i = 0 ; i < area.length ; i++)
		{
			for(int j = 0 ; j < areaDetail[i].length ; j++)
			{
				
				AreacodeVO vo = new AreacodeVO();
				
				vo.setA_AreaCode(area[i].substring(area[i].indexOf("|")+1) + ((j+1)+200));
				vo.setR_Area(area[i].substring(0,area[i].indexOf("|")));
				vo.setR_AreaDetail(areaDetail[i][j]);
				list.add(vo);
			}
		}	
		return list;
	}
	
	public static void main(String[] args) {

		AreacodeManager am = new AreacodeManager();
		ArrayList<AreacodeVO> list = new  ArrayList<AreacodeVO>();
		
		list = am.AreacodeAllData();
		
		for(int i = 0; i < list.size() ; i++)
		{
			System.out.printf(list.get(i).getA_AreaCode()+"   ");
			System.out.printf(list.get(i).getR_Area()+"   ");
			System.out.printf(list.get(i).getR_AreaDetail()+"   ");
			System.out.println();
		}
	}
	
}
