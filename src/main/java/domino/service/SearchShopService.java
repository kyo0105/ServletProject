package domino.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import domino.dao.CityDAO;
import domino.dto.ShopDTO;

public class SearchShopService {
	// 1. 싱글톤
	private SearchShopService() {}
	private static SearchShopService instance = new SearchShopService();
	public static SearchShopService getInstance() {
		return instance;

	}
	
	public List<ShopDTO> searchShop(String shop_name){
		Connection con = null;
		try {
			con = ConnectionProvider.getConnection();
			CityDAO dao = CityDAO.getInstance();
			List<ShopDTO> list = null;
			list = dao.searchShop(con, shop_name);
			return list;
		} catch (NamingException | SQLException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}	
}
