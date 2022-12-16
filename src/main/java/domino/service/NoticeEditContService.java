package domino.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import domino.dto.NoticeDTO;
import domino.dao.NoticeDAO;

public class NoticeEditContService {
	private NoticeEditContService() {}
	private static NoticeEditContService instance = new NoticeEditContService();
	public static NoticeEditContService getInstance() {
		return instance;
	}
	
	public NoticeDTO selectOne(int notice_code){
		
		Connection con = null;
		
		try {
			con = ConnectionProvider.getConnection();
			NoticeDAO dao = NoticeDAO.getInstance();
			
			NoticeDTO dto = dao.selectOne(con, notice_code);
			
			return dto;
			
		} catch (NamingException | SQLException e) {
			JdbcUtil.rollback(con);
			e.printStackTrace();
			throw new RuntimeException();
		}finally {
			JdbcUtil.close(con);
		}
	}
	
}
