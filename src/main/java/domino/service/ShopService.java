package domino.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import domino.dao.CityDAO;
import domino.dto.ShopDTO;

public class ShopService {

	// 1. 싱글톤
		private ShopService() {}
		private static ShopService instance = new ShopService();
		public static ShopService getInstance() {
			return instance;

	}
		
	
		public List<ShopDTO> selectShop(int loc_code){
			Connection con = null;
			try {
				con = ConnectionProvider.getConnection();
				CityDAO dao = CityDAO.getInstance();
				List<ShopDTO> list = null;
				list = dao.shopInfo(con, loc_code);
				return list;
			} catch (NamingException | SQLException e) {
				throw new RuntimeException(e);
			} finally {
				JdbcUtil.close(con);
			}
		}	
}
