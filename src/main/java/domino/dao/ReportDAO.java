package domino.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


import com.util.JdbcUtil;

import domino.dto.ReportDTO;

//DAO
public class ReportDAO implements IReport{
	
	private ReportDAO() {}
	private static ReportDAO instance = new ReportDAO();
	public static ReportDAO getInstance() {
		return instance;
	}

	
	@Override
	public int insert(Connection con,  ReportDTO dto) throws SQLException {
		
		PreparedStatement pstmt = null;
		
		int rowCount = 0;
		
		String sql = " insert into report ( report_code, name, tel, email, category, shop_loc, shop_name, content, member_id ) "
						+ " values ( report_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ? ) " ;
		
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getTel());
			pstmt.setString(3, dto.getEmail());
			pstmt.setString(4, dto.getCategory());
			pstmt.setString(5, dto.getShop_loc());
			pstmt.setString(6, dto.getShop_name());
			pstmt.setString(7, dto.getContent());
			pstmt.setString(8, dto.getMember_id());

			rowCount = pstmt.executeUpdate();
			
		}finally {
			JdbcUtil.close(pstmt);
		}

		return rowCount;
	}
	

}
