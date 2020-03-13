//////////////////////////////////////////////////////////���� �� �ϼ�
import com.sist.manager.*;
import java.util.*;
import java.sql.*;
import com.sist.vo.*;
public class DefaultDAO {

	private Connection conn; // Socket
	private PreparedStatement ps;// OutputStream , BufferedReader
	private final String URL="jdbc:oracle:thin:@211.238.142.207:1521:XE";
	//private final String URL="jdbc:oracle:thin:@localhost:1521:XE";
			

	// ����̹� ��� => �ѹ��� ����
	public DefaultDAO()
     {
    	 try
    	 {
    		 Class.forName("oracle.jdbc.driver.OracleDriver");
    	 }catch(Exception ex) 
    	 {
    		 ex.printStackTrace();
    	 }
     }

	// ����Ŭ ����
	public void getConnection() {
		try {
			conn = DriverManager.getConnection(URL, "hr", "happy");
		} catch (Exception ex) {
		}
	}

	// ����Ŭ ����
	public void disConnection() {
		try {
			if (ps != null)
				ps.close();
			if (conn != null)
				conn.close();
		} catch (Exception ex) {
		}
	}

	// ��� ó�� => �߰� ==> CURD
	public void AreacodeCreate() {
		try 
		{
			getConnection();
			
			String sql ="CREATE TABLE areacode(A_Area VARCHAR2(50), R_areacode VARCHAR2(50), r_areadetail VARCHAR2(50))";
			ps = conn.prepareStatement(sql);
			ps.executeQuery();
			
		}catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			disConnection();
		}
	}
	public void AreacodeInsert(AreacodeVO vo) {
		try {
			getConnection();
			String sql = "INSERT INTO areacode VALUES(?,?,?)";

//			private String r_Area;
//			private String r_AreaDetail;
//			private String a_AreaCode;
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getA_AreaCode());
			ps.setString(2, vo.getR_Area());
			ps.setString(3, vo.getR_AreaDetail());
			
			ps.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			disConnection();
			
		}
	}
}


