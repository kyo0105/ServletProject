package domino.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import domino.dto.NoticeDTO;
import domino.dao.NoticeDAO;

public class NoticeViewService {
	
	private NoticeViewService() {}
	private static NoticeViewService instance = new NoticeViewService();
	public static NoticeViewService getInstance() {
		return instance;
	}
	
	public Connection con = null;
	
	public List<NoticeDTO> select(String type, int notice_code){
		
		try {
			con = ConnectionProvider.getConnection();
			con.setAutoCommit(false);
			
			NoticeDAO dao = NoticeDAO.getInstance();
	        dao.updateHits(con, notice_code);	// 조회수 카운트
			List<NoticeDTO> list = dao.selectView(con, type);
			
			con.commit();
			
			return list;
			
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
			throw new RuntimeException();
		} finally {
			JdbcUtil.close(con);
		}
	}
	
	public List<NoticeDTO> select(String type, int notice_code, String searchCondition, String searchWord){
		
		try {
			con = ConnectionProvider.getConnection();
			NoticeDAO dao = NoticeDAO.getInstance();

			con.setAutoCommit(false);
	        dao.updateHits(con, notice_code);	// 조회수 카운트
			List<NoticeDTO> list = dao.searchView(con, type, searchCondition, searchWord);
			
			con.commit();
			
			return list;
			
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
			throw new RuntimeException();
		} finally {
			JdbcUtil.close(con);
		}
	}
	
}
