package domino.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import domino.dao.PizzaListDAO;
import domino.dto.ToppListDTO;

public class ToppListService {
	
	// 1. 싱글톤
	private ToppListService() {}
	private static ToppListService instance = new ToppListService();
	public static ToppListService getInstance() {
		return instance;

	}
	  public List<ToppListDTO> selectToppList(String topp_type){
	      // 
	      Connection con = null;
	      try {
	         con = ConnectionProvider.getConnection();
	         PizzaListDAO dao = PizzaListDAO.getInstance();
	         
	         List<ToppListDTO> toppDTO = null;
	         toppDTO = dao.selectToppList(con, topp_type);
	         
	         return toppDTO;
	         
	      } catch (NamingException | SQLException e) {
	         throw new RuntimeException(e);
	      } finally {
	         JdbcUtil.close(con);
	      }
	   }
}
