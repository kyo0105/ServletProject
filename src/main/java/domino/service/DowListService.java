package domino.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import domino.dao.PizzaListDAO;
import domino.dto.DowListDTO;

public class DowListService {
	
	// 1. 싱글톤
	private DowListService() {}
	private static DowListService instance = new DowListService();
	public static DowListService getInstance() {
		return instance;

	}
	  public List<DowListDTO> selectDowList(){
	      // 
	      Connection con = null;
	      try {
	         con = ConnectionProvider.getConnection();
	         PizzaListDAO dao = PizzaListDAO.getInstance();
	         
	         List<DowListDTO> dowDTO = null;
	         dowDTO = dao.selectDowList(con);
	         
	         return dowDTO;
	         
	      } catch (NamingException | SQLException e) {
	         throw new RuntimeException(e);
	      } finally {
	         JdbcUtil.close(con);
	      }
	   }
}
