package domino.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import domino.dto.InquiryDTO;
import domino.dao.InquiryDAO;

public class InquiryListService {
	private InquiryListService() {}
	private static InquiryListService instance = new InquiryListService();
	public static InquiryListService getInstance() {
		return instance;
	}
	
	public List<InquiryDTO> select(String member_id){
	      Connection con = null;
	      try {
	         con = ConnectionProvider.getConnection();
	         InquiryDAO dao = InquiryDAO.getInstance();
	         List<InquiryDTO> list = null;
	         list = dao.selectList(con, member_id);
	         
	         
	         
	         return list;
	      } catch (NamingException | SQLException e) {
	         throw new RuntimeException(e);
	      } finally {
	         JdbcUtil.close(con);
	      }
	}
	

}
