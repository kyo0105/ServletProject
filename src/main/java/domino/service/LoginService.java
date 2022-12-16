package domino.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import domino.dao.EmpDAO;
import domino.dao.MemberDAO;
import domino.dto.EmpDTO;
import domino.dto.MemberDTO;

public class LoginService {

	private LoginService() {}
	private static LoginService instance = new LoginService();
	public static LoginService getInstance() {
		return instance;
	}
	
	public Connection con = null;
	
	// 회원 로그인
	public MemberDTO loginM(String member_id, String pw) {
				
		try {
			con = ConnectionProvider.getConnection();
			MemberDAO dao = MemberDAO.getInstance();
			MemberDTO dto = dao.loginAction(con, member_id);
			
			// 회원 로그인 실패
			if(dto != null && !dto.matchPassword(pw)) {
				return null;
			}		
			
			return dto;
			
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
			throw new RuntimeException();
		} finally {
			JdbcUtil.close(con);
		}

	}

	// 관리자 로그인
	public EmpDTO loginE(String emp_id, String pw) {
		
		try {
			con = ConnectionProvider.getConnection();
			EmpDAO dao = EmpDAO.getInstance();
			EmpDTO dto = dao.loginAction(con, emp_id);
			
			// 관리자 로그인 실패
			if(dto != null && !dto.matchPassword(pw)) {
				return null;
			}				

			return dto;

		} catch (NamingException | SQLException e) {
			e.printStackTrace();
			throw new RuntimeException();
		} finally {
			JdbcUtil.close(con);
		}

	}

}
