package domino.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import domino.dto.DowListDTO;
import domino.dto.DrinkListDTO;
import domino.dto.PizzaListDTO;
import domino.dto.SideDishListDTO;
import domino.dto.ToppListDTO;

public interface IDomino {

	// 피자 메뉴 페이지
	List<PizzaListDTO> selectPizzatList(Connection con) throws SQLException;

	// 사이드디시 정보
	List<SideDishListDTO> selectSideDishList(Connection con) throws SQLException;

	// 음료 정보
	List<DrinkListDTO> selectDrinkList(Connection con) throws SQLException;
	
	// 도우 정보
	List<DowListDTO> selectDowList(Connection con) throws SQLException;

	// 토핑 정보
	List<ToppListDTO> selectToppList(Connection con, String topp_type) throws SQLException;
	
	// 피자 주문 페이지
	PizzaListDTO selectPizzaDetail(Connection con, String pizza_name) throws SQLException;
	




}
