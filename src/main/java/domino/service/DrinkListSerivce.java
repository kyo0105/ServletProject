package domino.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import domino.dao.PizzaListDAO;
import domino.dto.DrinkListDTO;

public class DrinkListSerivce {
	
	// 1. 싱글톤
	private DrinkListSerivce() {}
	private static DrinkListSerivce instance = new DrinkListSerivce();
	public static DrinkListSerivce getInstance() {
		return instance;

	}
	  public List<DrinkListDTO> selectDrinkList(){
	      // 
	      Connection con = null;
	      try {
	         con = ConnectionProvider.getConnection();
	         PizzaListDAO dao = PizzaListDAO.getInstance();
	         List<DrinkListDTO> drinkDTO = null;
	         
	         drinkDTO = dao.selectDrinkList(con);
	         return drinkDTO;
	      } catch (NamingException | SQLException e) {
	         throw new RuntimeException(e);
	      } finally {
	         JdbcUtil.close(con);
	      }
	   }
}
