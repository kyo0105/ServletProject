package domino.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.util.JdbcUtil;

import domino.dto.FaqDTO;

public class FaqDAO implements IFaq {

	private FaqDAO() {}
	private static FaqDAO instance = new FaqDAO();
	public static FaqDAO getInstance() {
		return instance;
	}
	

	@Override
	public List<FaqDTO> selectList(Connection con, String faq_category) throws SQLException {
		
		String sql = " select * "
		+ " from faq "
		+ " where faq_category = ? "
		+ " order by faq_category desc ";
		
		ArrayList<FaqDTO> list = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, faq_category);
			rs = pstmt.executeQuery();
			if ( rs.next() ) {
				list = new ArrayList<FaqDTO>();
				FaqDTO dto = null;
				do {
					
					dto =  new FaqDTO();
					dto.setFaq_code(rs.getInt("faq_code"));
					dto.setFaq_category(rs.getString("faq_category"));
					dto.setQuestion(rs.getString("question"));
					dto.setEmp_id(rs.getString("emp_id"));
					dto.setAnswer(rs.getString("answer"));
					
					list.add(dto);
					
					
				} while ( rs.next() );
				
			}//if
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);         
		} // finally

		return list;

	}
	
	
	@Override
	public ArrayList<FaqDTO> search( Connection con, int searchCondition, String searchWord) throws SQLException{
		
	
		String sql = "SELECT * "
				+ "	FROM faq "
				+ "	WHERE question like '%?%' " ;

		ArrayList<FaqDTO> list  = null;
		PreparedStatement pstmt  = null;
		ResultSet rs = null;
		
		try {
			
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1,searchWord);
		rs = pstmt.executeQuery();
		FaqDTO dto = null;

		if (rs.next()) {
			list = new ArrayList<FaqDTO>();
			
			do {
			
				dto = new FaqDTO();
				dto.setFaq_code(rs.getInt("faq_code"));
				dto.setFaq_category(rs.getString("faq_category"));
				dto.setQuestion(rs.getString("question"));
				dto.setEmp_id(rs.getString("emp_id"));
				dto.setAnswer(rs.getString("answer"));
				list.add(dto);
				
			} while (rs.next());
			
		}//if
		
		}finally {

		JdbcUtil.close(pstmt);
		JdbcUtil.close(rs);

		}
		
		return list;

	}


	
	

	/* @Override */
/*	public FaqDTO select(Connection con, int faq_code, String question) throws SQLException {
		// TODO Auto-generated method stub
		return null;
		
		String sql =" select t.* "
				+ "from(select rank() OVER (ORDER BY faq_code) question, answer.* "
				+ "     from faq "
				+ "order by faq_code desc";
		
		ArrayList<FaqDTO> list = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

			
			if ( rs.next() ) {
				list = new ArrayList<FaqDTO>();
				FaqDTO dto = null;
				do {
					dto =  new FaqDTO();
					dto.setFaq_code(rs.getInt("faq_code"));
					dto.setFaq_category(rs.getString("faq_category"));
					dto.setQuestion(rs.getString("question"));
					dto.setEmp_id(rs.getString("emp_id"));
					list.add(dto);
				} while ( rs.next() );
				
			}//if

		return list;
		
	}*/


	

	
}
