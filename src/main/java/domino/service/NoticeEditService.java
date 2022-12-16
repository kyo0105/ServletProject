package domino.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import domino.dto.NoticeDTO;
import domino.dao.NoticeDAO;

public class NoticeEditService {
	private NoticeEditService() {}
	private static NoticeEditService instance = new NoticeEditService();
	public static NoticeEditService getInstance() {
		return instance;
	}
	
	public int update(NoticeDTO dto){
		
		Connection con = null;
		int rowCount =0;
		
		try {
			con = ConnectionProvider.getConnection();
			NoticeDAO dao = NoticeDAO.getInstance();
			
			rowCount = dao.update(con, dto);
			
		} catch (NamingException | SQLException e) {
			JdbcUtil.rollback(con);
			e.printStackTrace();
			throw new RuntimeException();
		}finally {
			JdbcUtil.close(con);
		}
		return rowCount;
		
	}
	
}
