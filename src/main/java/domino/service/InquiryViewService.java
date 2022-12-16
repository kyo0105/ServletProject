package domino.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import domino.dto.InquiryDTO;
import domino.dao.InquiryDAO;

public class InquiryViewService {
	private InquiryViewService() {}
	private static InquiryViewService instance = new InquiryViewService();
	public static InquiryViewService getInstance() {
		return instance;
	}
	
	public InquiryDTO select(int iq_code){
		Connection con = null;
	      try {
	         con = ConnectionProvider.getConnection();
	         InquiryDAO dao = InquiryDAO.getInstance();
	         
	         InquiryDTO dto = null;
	         dto = dao.selectOne(con, iq_code);
	         return dto;
	      } catch (NamingException | SQLException e) {
	         throw new RuntimeException(e);
	      } finally {
	         JdbcUtil.close(con);
	      }
	}
}
