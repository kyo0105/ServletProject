package domino.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import domino.dto.ReportDTO;
import domino.dao.ReportDAO;


public class ReportWriteService {
	private ReportWriteService() {}
	private static ReportWriteService instance = new ReportWriteService();
	public static ReportWriteService getInstance() {
		return instance;
	}
	
	public int write(ReportDTO dto) {
		
		Connection con = null;
		
		int rowCount = 0;
		
		try {
			con = ConnectionProvider.getConnection();
			ReportDAO dao = ReportDAO.getInstance();
			
			rowCount = dao.insert(con, dto);
			
		} catch (NamingException | SQLException e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(con);
			
		}//finally
		
		return rowCount;
	}
}
	
	
