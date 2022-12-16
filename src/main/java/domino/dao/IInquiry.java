package domino.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import domino.dto.InquiryDTO;

public interface IInquiry {
	
	//1.문의 목록
	List<InquiryDTO> selectList(Connection con, String member_id) throws SQLException;

	//3. 상세보기
	InquiryDTO selectOne(Connection con, int iq_code) throws SQLException;

	//2. WRITE INOTICE 
	int insert(Connection con, InquiryDTO dto) throws SQLException;
	
	//4. emp 문의 관리
	int update(Connection con, int iq_code, String emp_id )throws SQLException;

	//5. emp 총 목록
	List<InquiryDTO> selectAll(Connection con) throws SQLException;

}
