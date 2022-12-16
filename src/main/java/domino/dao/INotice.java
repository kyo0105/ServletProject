package domino.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import domino.dto.NoticeDTO;

public interface INotice {

	// 1.1 페이징 처리된 공지 목록 반환
	List<NoticeDTO> selectList(Connection con, String type, int currentPage, int numberPerPage) throws SQLException;
	
	// 1.2 총 공지 수 반환
	int getTotalRecords(Connection con, String type) throws SQLException;
	
	// 2.1 공지 검색
	List<NoticeDTO> searchList(Connection con, String type, int currentPage, int numberPerPage, String searchCondition, String searchWord) throws SQLException;
	
	// 2.2 검색된 총 공지 수 반환 + 검색조건&검색어
	int getTotalRecords(Connection con, String type, String searchCondition, String searchWord) throws SQLException;
	
	// 3.1 공지 상세보기	
	List<NoticeDTO> selectView(Connection con, String type) throws SQLException;
	
	// 3.2 공지 검색 상세보기
	List<NoticeDTO> searchView(Connection con, String type, String searchCondition, String searchWord) throws SQLException;
	
	// 3.3 조회수 증가
	int updateHits( Connection con, int notice_code ) throws SQLException;
	
	// 4. 공지 작성
	int insert(Connection con, NoticeDTO dto) throws SQLException;
	
	// 5. 공지 삭제
	int delete(Connection con, int notice_code) throws SQLException;
	
	// 6.1 공지 수정
	int update(Connection con, NoticeDTO dto) throws SQLException;
	
	// 6.2 공지 수정 글 가져오기
	NoticeDTO selectOne(Connection con, int num) throws SQLException;
	
}
