package domino.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import domino.dao.PizzaListDAO;
import domino.dto.SideDishListDTO;

public class SideDishListService {
	
	// 1. 싱글톤
	private SideDishListService() {}
	private static SideDishListService instance = new SideDishListService();
	public static SideDishListService getInstance() {
		return instance;

	}
	  public List<SideDishListDTO> selectSideDishList(){
	      // 
	      Connection con = null;
	      try {
	         con = ConnectionProvider.getConnection();
	         PizzaListDAO dao = PizzaListDAO.getInstance();
	         
	         List<SideDishListDTO> sideDTO = null;
	         sideDTO = dao.selectSideDishList(con);
	         
	         return sideDTO;
	      } catch (NamingException | SQLException e) {
	         throw new RuntimeException(e);
	      } finally {
	         JdbcUtil.close(con);
	      }
	   }
}
