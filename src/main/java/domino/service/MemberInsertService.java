package domino.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import domino.dao.MemberDAO;
import domino.dto.AgreeDTO;
import domino.dto.MemberDTO;

public class MemberInsertService {
	
	private MemberInsertService() {}
	private static MemberInsertService instance = new MemberInsertService();
	public static MemberInsertService getInstance() {
		return instance;
	}

	public void memberInsert(MemberDTO mdto, AgreeDTO adto) {
		
		Connection con = null;	
		
		try {
			con = ConnectionProvider.getConnection();
			con.setAutoCommit(false);

			MemberDAO mdao = MemberDAO.getInstance();
			mdao.memberInsert(con, mdto, adto);
			
			con.commit();
			
		} catch (NamingException | SQLException e) {
			JdbcUtil.rollback(con);
			e.printStackTrace();
			throw new RuntimeException();
		} finally {
			JdbcUtil.close(con);
		}
		
	}
	
}
