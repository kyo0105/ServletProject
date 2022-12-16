package domino.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.util.JdbcUtil;

import domino.dto.DowListDTO;
import domino.dto.DrinkListDTO;
import domino.dto.PizzaListDTO;
import domino.dto.SideDishListDTO;
import domino.dto.ToppListDTO;

public class PizzaListDAO implements IDomino{

	// 1. 싱글톤
	private PizzaListDAO() {}
	private static PizzaListDAO instance = new PizzaListDAO();
	public static PizzaListDAO getInstance() {
		return instance;
	}

	@Override
	public List<PizzaListDTO> selectPizzatList(Connection con) throws SQLException {

		String sql = "select * from pizza_menu";
		ArrayList<PizzaListDTO> list = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if ( rs.next() ) {
				list = new ArrayList<PizzaListDTO>();
				PizzaListDTO dto = null;
				do {
					dto =  new PizzaListDTO();

					dto.setPizza_name(rs.getString("pizza_name"));
					dto.setPizza_image( rs.getString("pizza_image"));
					dto.setLarge(rs.getInt("large"));
					dto.setMideum(rs.getInt("mideum"));
					dto.setPizza_tag(rs.getString("pizza_tag"));
					dto.setPizza_type(rs.getString("pizza_type"));

					list.add(dto);
				} while ( rs.next() );
			}
		} finally { 
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return list;
	}

	@Override
	public PizzaListDTO selectPizzaDetail(Connection con, String pizza_name) throws SQLException {

		String sql = "select * from pizza_menu WHERE pizza_name = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		PizzaListDTO dto = null;
		try {
			pstmt = con.prepareStatement(sql);	
			pstmt.setString(1, pizza_name);
			rs = pstmt.executeQuery();

			if ( rs.next() ) {
				do {
					dto =  new PizzaListDTO();

					dto.setPizza_name(rs.getString("pizza_name"));
					dto.setPizza_image( rs.getString("pizza_image"));
					dto.setLarge(rs.getInt("large"));
					dto.setMideum(rs.getInt("mideum"));
					dto.setPizza_tag(rs.getString("pizza_tag"));
					dto.setPizza_type(rs.getString("pizza_type"));

				} while ( rs.next() );
			} // 
		} finally { 
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		} // finally

		return dto;
	}

	@Override
	public List<SideDishListDTO> selectSideDishList(Connection con) throws SQLException {

		String sql = "select * from side_dish ";
		ArrayList<SideDishListDTO> sidelist = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if ( rs.next() ) {
				sidelist = new ArrayList<SideDishListDTO>();
				SideDishListDTO dto = null;
				do {
					dto =  new SideDishListDTO();

					dto.setSide_name(rs.getString("side_name"));
					dto.setSide_price(rs.getInt("side_price"));
					dto.setSide_type(rs.getString("side_type"));
					dto.setSide_img(rs.getString("side_img"));

					sidelist.add(dto);
				} while ( rs.next() );
			} // 
		} finally { 
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		} // finally

		return sidelist;
	}

	@Override
	public List<DrinkListDTO> selectDrinkList(Connection con) throws SQLException {

		String sql = "select * from drink_etc ";
		ArrayList<DrinkListDTO> drinklist = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if ( rs.next() ) {
				drinklist = new ArrayList<DrinkListDTO>();
				DrinkListDTO dto = null;
				do {
					dto =  new DrinkListDTO();

					dto.setDrink_name(rs.getString("drink_name"));
					dto.setDrink_price(rs.getInt("drink_price"));
					dto.setDrink_img(rs.getString("drink_img"));

					drinklist.add(dto);
				} while ( rs.next() );
			} // 
		} finally { 
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		} // finally

		return drinklist;
	}

	@Override
	public List<DowListDTO> selectDowList(Connection con) throws SQLException {
		System.out.println("DB연결 완료 sql");
		String sql = "select * from dow ";
		ArrayList<DowListDTO> dowList = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if ( rs.next() ) {
				dowList = new ArrayList<DowListDTO>();
				DowListDTO dto = null;
				do {
					dto =  new DowListDTO();

					dto.setDow_name(rs.getString("dow_name"));
					dto.setDow_price(rs.getInt("dow_price"));
					dto.setDow_img(rs.getString("dow_img"));

					dowList.add(dto);
				} while ( rs.next() );
			} // 
		} finally { 
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		} // finally

		return dowList;
	}

	// 토핑 정보 가져오기
	@Override
	public List<ToppListDTO> selectToppList(Connection con, String topp_type) throws SQLException {
		String sql = "SELECT * FROM topping WHERE topp_type = ? ";
		ArrayList<ToppListDTO> toppList = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, topp_type);
			rs = pstmt.executeQuery();
			if ( rs.next() ) {
				toppList = new ArrayList<ToppListDTO>();
				ToppListDTO dto = null;
				do {
					dto =  new ToppListDTO();

					dto.setTopp_name(rs.getString("topp_name"));
					dto.setTopp_price(rs.getInt("topp_price"));
					dto.setTopp_img(rs.getString("topp_img"));
					dto.setTopp_type(rs.getString("topp_type"));


					toppList.add(dto);
				} while ( rs.next() );
			} // 
		} finally { 
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		} // finally

		return toppList;
	}
}
