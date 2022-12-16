package domino.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import domino.dto.InquiryDTO;
import domino.dao.InquiryDAO;

public class InquiryEmpListService {
	private InquiryEmpListService() {}
	private static InquiryEmpListService instance = new InquiryEmpListService();
	public static InquiryEmpListService getInstance() {
		return instance;
	}
	
	public List<InquiryDTO> select(){
	      Connection con = null;
	      try {
	         con = ConnectionProvider.getConnection();
	         InquiryDAO dao = InquiryDAO.getInstance();
	         List<InquiryDTO> list = null;
	         list = dao.selectAll(con);
	         
	         return list;
	      } catch (NamingException | SQLException e) {
	         throw new RuntimeException(e);
	      } finally {
	         JdbcUtil.close(con);
	      }
	}
	

}
