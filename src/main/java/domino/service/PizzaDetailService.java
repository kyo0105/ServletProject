package domino.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import domino.dao.PizzaListDAO;
import domino.dto.PizzaListDTO;

public class PizzaDetailService {
	// 1. 싱글톤
	private PizzaDetailService() {}
	private static PizzaDetailService instance = new PizzaDetailService();
	public static PizzaDetailService getInstance() {
		return instance;

	}

	public PizzaListDTO selectPizzaDetail(String pizza_name) {
		// 
		Connection con = null;
		try {
			con = ConnectionProvider.getConnection();
			PizzaListDAO dao = PizzaListDAO.getInstance();
	
			PizzaListDTO pizzaDTO = null;
			
			pizzaDTO = dao.selectPizzaDetail(con, pizza_name);

			return pizzaDTO;
			
		
		} catch (NamingException | SQLException e) {
			JdbcUtil.rollback(con);
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}
}
