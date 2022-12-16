package domino.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import domino.dto.CityDTO;
import domino.dto.ShopDTO;


public interface ICity {

	// 1. 지역 정보
	List<CityDTO> cityInfo( Connection con, String city ) throws SQLException;
	
	// 2.select 박스 매장 정보
	List<ShopDTO> shopInfo( Connection con, int loc_code) throws SQLException;
	
	// 3. input text 매장 검색
	List<ShopDTO> searchShop( Connection con, String shop_name) throws SQLException;
}
