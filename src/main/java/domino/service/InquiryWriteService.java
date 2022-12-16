package domino.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import domino.dto.InquiryDTO;
import domino.dao.InquiryDAO;

public class InquiryWriteService {
	private InquiryWriteService() {}
	private static InquiryWriteService instance = new InquiryWriteService();
	public static InquiryWriteService getInstance() {
		return instance;
	}
	
	public int write(InquiryDTO dto) {
		Connection con = null;
		int rowCount = 0;
		try {
			con = ConnectionProvider.getConnection();
			InquiryDAO dao = InquiryDAO.getInstance();
			
			rowCount = dao.insert(con, dto);
			
		} catch (NamingException | SQLException e) {
			//JdbcUtil.rollback(con);
			//throw new RuntimeException();
			e.printStackTrace();
		}finally {
			JdbcUtil.close(con);
		}//finally
		return rowCount;
	}
} 
