package domino.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.util.JdbcUtil;

import domino.dto.CityDTO;
import domino.dto.ShopDTO;



public class CityDAO implements ICity{

	// 1. 싱글톤
	private CityDAO() {}
	private static CityDAO instance = new CityDAO();
	public static CityDAO getInstance() {
		return instance;
	}
	
	@Override
	public List<CityDTO> cityInfo(Connection con, String city) throws SQLException {

		String sql = "select * from location where city=? ";
		ArrayList<CityDTO> loc = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, city);
			rs = pstmt.executeQuery();
			if ( rs.next() ) {
				loc = new ArrayList<CityDTO>();
				CityDTO dto = null;
				do {
					dto =  new CityDTO();

					dto.setLoc_code(rs.getInt("loc_code"));
					dto.setCity(rs.getString("city"));
					dto.setDistrict(rs.getString("district"));
					
					loc.add(dto);
				} while ( rs.next() );
			} // 
		} finally { 
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		} // finally

		return loc;
	}

	@Override
	public List<ShopDTO> shopInfo(Connection con, int loc_code) throws SQLException {
		
		String sql = "select * from shop where loc_code=? ";
		ArrayList<ShopDTO> shop = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, loc_code);
			rs = pstmt.executeQuery();
			if ( rs.next() ) {
				shop = new ArrayList<ShopDTO>();
				ShopDTO shopdto = null;
				do {
					shopdto =  new ShopDTO();

					shopdto.setLoc_code(rs.getInt("loc_code"));
					shopdto.setEmp_id2(rs.getString("emp_id2"));
					shopdto.setShop_addr(rs.getString("shop_addr"));
					shopdto.setShop_detail_addr(rs.getString("shop_detail_addr"));
					shopdto.setShop_etc(rs.getString("shop_etc"));
					shopdto.setShop_image(rs.getString("shop_image"));
					shopdto.setShop_name(rs.getString("shop_name"));
					shopdto.setShop_parking(rs.getString("shop_parking"));
					shopdto.setShop_tel(rs.getString("shop_tel"));
					shopdto.setShop_time(rs.getString("shop_time"));
					shopdto.setSpecial_sale(rs.getString("special_sale"));
					
					shop.add(shopdto);
				} while ( rs.next() );
			} // 
		} finally { 
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		} // finally

		return shop;
	}

	@Override
	public List<ShopDTO> searchShop(Connection con, String shop_name) throws SQLException {
		String sql = "select * from shop where shop_name=? ";
		ArrayList<ShopDTO> shop = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, shop_name);
			rs = pstmt.executeQuery();
			if ( rs.next() ) {
				shop = new ArrayList<ShopDTO>();
				ShopDTO shopdto = null;
				do {
					shopdto =  new ShopDTO();

					shopdto.setLoc_code(rs.getInt("loc_code"));
					shopdto.setEmp_id2(rs.getString("emp_id2"));
					shopdto.setShop_addr(rs.getString("shop_addr"));
					shopdto.setShop_detail_addr(rs.getString("shop_detail_addr"));
					shopdto.setShop_etc(rs.getString("shop_etc"));
					shopdto.setShop_image(rs.getString("shop_image"));
					shopdto.setShop_name(rs.getString("shop_name"));
					shopdto.setShop_parking(rs.getString("shop_parking"));
					shopdto.setShop_tel(rs.getString("shop_tel"));
					shopdto.setShop_time(rs.getString("shop_time"));
					shopdto.setSpecial_sale(rs.getString("special_sale"));
					
					shop.add(shopdto);
				} while ( rs.next() );
			} // 
		} finally { 
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		} // finally

		return shop;
	}

	
	
	
	
	
}
