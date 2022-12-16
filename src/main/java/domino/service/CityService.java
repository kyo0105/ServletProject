package domino.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import domino.dao.CityDAO;
import domino.dto.CityDTO;



public class CityService {

	// 1. 싱글톤
	private CityService() {}
	private static CityService instance = new CityService();
	public static CityService getInstance() {
		return instance;

	}
	
	
	public List<CityDTO> selectCity(String city){
		Connection con = null;
		try {
			con = ConnectionProvider.getConnection();
			CityDAO dao = CityDAO.getInstance();
			List<CityDTO> list = null;
			list = dao.cityInfo(con, city);
			return list;
		} catch (NamingException | SQLException e) {
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(con);
		}
	}

}
