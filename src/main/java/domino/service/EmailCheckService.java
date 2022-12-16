package domino.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.NamingException;

import com.util.ConnectionProvider;

import domino.dao.MemberDAO;
import net.sf.json.JSONObject;

public class EmailCheckService {
	
	private EmailCheckService() {}
	private static EmailCheckService instance = new EmailCheckService();
	public static EmailCheckService getInstance() {
		return instance;
	}
	
	public JSONObject emailCheck(String email) {
			
			Connection con = null;
			JSONObject data = new JSONObject();
			int emailChk = 0;
			
			try {
				con = ConnectionProvider.getConnection();
				MemberDAO dao = MemberDAO.getInstance();
				
				emailChk = dao.memberEmailChk(con, email);
				
				if( emailChk == 0 ) {			// 이메일 중복 X
					data.put("status", "success");
				} else if ( emailChk == 1 ) {	// 이메일 중복 O
					data.put("status", "fail");
				}
			
			} catch (NamingException | SQLException e) {
				throw new RuntimeException(e);
			}
			
			return data;
		}
		
}
