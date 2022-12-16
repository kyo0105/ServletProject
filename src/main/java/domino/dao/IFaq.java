package domino.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList; 

import domino.dto.FaqDTO;

public interface IFaq {
	
	
		// 1. faq 목록
		List<FaqDTO> selectList(Connection con, String faq_category) throws SQLException;
		
		/*
		 * // 2. faq 보기 FaqDTO select(Connection con, int faq_code, String question)
		 * throws SQLException;
		 */
		
		//3. faq 검색
		ArrayList<FaqDTO> search(Connection con, int searchCondition, String searchWord) throws SQLException;

}
