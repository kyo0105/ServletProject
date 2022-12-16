package domino.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import domino.dto.NoticeDTO;
import domino.dao.NoticeDAO;

public class NoticeListService {
	
	private NoticeListService() {}
	private static NoticeListService instance = new NoticeListService();
	public static NoticeListService getInstance() {
		return instance;
	}

	public Connection con = null;
	
	public List<NoticeDTO> select(String type, int currentPage, int numberPerPage){
		
		try {
			con = ConnectionProvider.getConnection();
			NoticeDAO dao = NoticeDAO.getInstance();
			List<NoticeDTO> list = dao.selectList(con, type, currentPage, numberPerPage);

			return list;
			
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
			throw new RuntimeException();
		} finally {
			JdbcUtil.close(con);
		}
		
	}
	
	public List<NoticeDTO> select(String type, int currentPage, int numberPerPage, String searchCondition, String searchWord){
		
		try {
			con = ConnectionProvider.getConnection();
			NoticeDAO dao = NoticeDAO.getInstance();
			List<NoticeDTO> list = dao.searchList(con, type, currentPage, numberPerPage, searchCondition, searchWord);
		
			return list;
			
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
			throw new RuntimeException();
		} finally {
			JdbcUtil.close(con);
		}
		
	}
}
