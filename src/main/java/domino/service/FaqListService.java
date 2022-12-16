package domino.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import domino.dto.FaqDTO;
import domino.dao.FaqDAO;


public class FaqListService {

	private FaqListService() {}
	private static FaqListService instance = new FaqListService();
	public static FaqListService getInstance() {
		return instance;
	}
	
	public List<FaqDTO> select(String faq_category){
	      Connection con = null;
	      try {
	         con = ConnectionProvider.getConnection();
	         FaqDAO dao = FaqDAO.getInstance();
	         List<FaqDTO> list = null;
	         list = dao.selectList(con, faq_category);
	         return list;
	      } catch (NamingException | SQLException e) {
	         throw new RuntimeException(e);
	      } finally {
	         JdbcUtil.close(con);
	      }
	}
	
	
}
