package domino.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import domino.dto.PageBlock;
import domino.dao.NoticeDAO;

public class NoticePagingService {

	private NoticePagingService() {}
	private static NoticePagingService instance = new NoticePagingService();
	public static NoticePagingService getInstance() {
		return instance;
	}
	
	public Connection con = null;
	
	public PageBlock paging(String type, int currentPage, int numberPerPage) {
		
		PageBlock pageBlock = null;
		
		int numberOfPageBlock = 10;
		int totalRecords , totalPages = 0;
		try {
			con = ConnectionProvider.getConnection();
			NoticeDAO dao = NoticeDAO.getInstance();
			
			totalRecords = dao.getTotalRecords(con, type);
			totalPages = (int)Math.ceil((double)totalRecords / numberPerPage);  // 총페이지수
			
			pageBlock = new PageBlock();
			pageBlock.setCurrentPage(currentPage);
			pageBlock.setNumberPerPage(numberPerPage);
			pageBlock.setNumberOfPageBlock(numberOfPageBlock);
			pageBlock.setTotalRecords(totalRecords);
			pageBlock.setTotalPages(totalPages);
			int start = (currentPage-1) / numberOfPageBlock * numberOfPageBlock + 1;
			pageBlock.setStart(start);
			int end = start + numberOfPageBlock -1;
			if(end > totalPages) end = totalPages;
			pageBlock.setEnd(end);
						
			if(start != 1) pageBlock.setPrev(true); //이전버튼
			if(end != totalPages) pageBlock.setNext(true); //다음버튼
			
			return pageBlock;
			
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
			throw new RuntimeException();
		} finally {
			JdbcUtil.close(con);
		}
		
	}
	
	public PageBlock paging(String type, int currentPage, int numberPerPage, String searchCondition, String searchWord) {
		
		PageBlock pageBlock = null;
		
		int numberOfPageBlock = 10;
		int totalRecords , totalPages = 0;
		try {
			con = ConnectionProvider.getConnection();
			NoticeDAO dao = NoticeDAO.getInstance();
			
			totalRecords = dao.getTotalRecords(con, type, searchCondition, searchWord); 
			totalPages =  (int)Math.ceil((double)totalRecords / numberPerPage);  // 총페이지수
			
			pageBlock = new PageBlock();
			pageBlock.setCurrentPage(currentPage);
			pageBlock.setNumberPerPage(numberPerPage);
			pageBlock.setNumberOfPageBlock(numberOfPageBlock);
			pageBlock.setTotalRecords(totalRecords);
			pageBlock.setTotalPages(totalPages);
			int start = (currentPage - 1) / numberOfPageBlock * numberOfPageBlock + 1;
			pageBlock.setStart(start);
			int end = start + numberOfPageBlock - 1;
			if(end > totalPages) end = totalPages;
			pageBlock.setEnd(end);
						
			if(start != 1) pageBlock.setPrev(true); //이전버튼
			if(end != totalPages) pageBlock.setNext(true); //다음버튼
			
			return pageBlock;
			
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
			throw new RuntimeException();
		} finally {
			JdbcUtil.close(con);
		}
		
	}
}
