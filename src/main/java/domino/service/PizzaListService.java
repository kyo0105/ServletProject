package domino.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import domino.dao.PizzaListDAO;
import domino.dto.PizzaListDTO;

public class PizzaListService {

	// 1. 싱글톤
	private PizzaListService() {}
	private static PizzaListService instance = new PizzaListService();
	public static PizzaListService getInstance() {
		return instance;

	}
	public List<PizzaListDTO> selectPizzaList(){
		Connection con = null;
		try {
			con = ConnectionProvider.getConnection();
			PizzaListDAO dao = PizzaListDAO.getInstance();
			List<PizzaListDTO> list = null;
			list = dao.selectPizzatList(con);
			return list;
		} catch (NamingException | SQLException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}
}
