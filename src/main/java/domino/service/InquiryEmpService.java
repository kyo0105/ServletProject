package domino.service;

import java.sql.Connection;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import domino.dao.InquiryDAO;

public class InquiryEmpService {
	private InquiryEmpService() {}
	private static InquiryEmpService instance = new InquiryEmpService();
	public static InquiryEmpService getInstance() {
		return instance;
	}
	
	public int update(int iq_code, String emp_id){
		Connection con = null;
		int rowCount =0;
		try {
			con = ConnectionProvider.getConnection();
			InquiryDAO dao = InquiryDAO.getInstance();
			rowCount = dao.update(con, iq_code, emp_id);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}finally {
			JdbcUtil.close(con);
		}
		return rowCount;
		
	}//update()
	
}