package domino.service;

import java.sql.Connection;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import domino.dao.NoticeDAO;

public class NoticeDeleteService {
	private NoticeDeleteService() {}
	private static NoticeDeleteService instance = new NoticeDeleteService();
	public static NoticeDeleteService getInstance() {
		return instance;
	}
	
	public int delete(int num) {
		
		Connection con = null;
		int rowCount = 0;

		try {
			con = ConnectionProvider.getConnection();
			NoticeDAO dao = NoticeDAO.getInstance();
			
			rowCount = dao.delete(con, num);
			
		} catch (Exception e) {
			JdbcUtil.rollback(con);
			e.printStackTrace();
			throw new RuntimeException();
		} finally {
			JdbcUtil.close(con);
		}
		
		return rowCount;
	}
}
