package domino.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import domino.dao.EmpDAO;
import domino.dao.MemberDAO;
import net.sf.json.JSONObject;

public class IdCheckService {
	
	private IdCheckService() {}
	private static IdCheckService instance = new IdCheckService();
	public static IdCheckService getInstance() {
		return instance;
	}
	
	public JSONObject idCheck(String id) {
		
		Connection con = null;
		JSONObject data = new JSONObject();
		int empIdChk = 0;
		int memberIdChk = 0;
		
		try {
			con = ConnectionProvider.getConnection();
			EmpDAO edao = EmpDAO.getInstance();
			MemberDAO mdao = MemberDAO.getInstance();
			
			empIdChk = edao.empIdChk(con, id);
			memberIdChk = mdao.memberIdChk(con, id);
			
			if( memberIdChk == 0 && empIdChk == 0 ) {		  // 아이디 중복 X
				data.put("status", "success");
				data.put("msg", id);
			} else if ( memberIdChk == 1 || empIdChk == 1) {  // 아이디 중복 O
				data.put("status", "fail");
			}
		
		} catch (NamingException | SQLException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
		
		return data;
	}
}
