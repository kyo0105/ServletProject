package domino.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import domino.dao.MemberDAO;
import net.sf.json.JSONObject;

public class PhoneAuthService {

	private PhoneAuthService() {}
	private static PhoneAuthService instance = new PhoneAuthService();
	public static PhoneAuthService getInstance() {
		return instance;
	}
	
	public JSONObject memberCheck(String tel) {
		
		Connection con = null;
		JSONObject data = new JSONObject();
		int check = 0;
		
		try {
			con = ConnectionProvider.getConnection();
			MemberDAO dao = MemberDAO.getInstance();
			check = dao.phoneAuth(con, tel);
			
			if (check == 0) data.put("status", "success");
			else			data.put("status", "fail");
			
		} catch (NamingException | SQLException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
		
		return data;
	}
	
}
