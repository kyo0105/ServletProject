package domino.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.util.JdbcUtil;

import domino.dto.InquiryDTO;

public class InquiryDAO implements IInquiry{
	private InquiryDAO() {}
	private static InquiryDAO instance = new InquiryDAO();
	public static InquiryDAO getInstance() {
		return instance;
	}
	@Override
	public List<InquiryDTO> selectList(Connection con, String member_id) throws SQLException {
		String sql =" select * "
				+ "from inquiry "
				+ "where member_id = ? "
				+ "order by iq_code desc";
		
		ArrayList<InquiryDTO> list = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member_id);
			rs = pstmt.executeQuery();
			if ( rs.next() ) {
				list = new ArrayList<InquiryDTO>();
				InquiryDTO dto = null;
				do {
					dto =  new InquiryDTO();
					dto.setIq_code(rs.getInt("iq_code"));
					dto.setCategory(rs.getString("category"));
					dto.setShop_loc(rs.getString("shop_loc"));
					dto.setShop_name(rs.getString("shop_name"));
					dto.setIq_title(rs.getString("iq_title"));
					dto.setIq_date(rs.getDate("iq_date"));
					dto.setIq_content(rs.getString("iq_content"));
					dto.setEmp_id(rs.getString("emp_id"));
					dto.setMember_id(rs.getString("member_id"));
					
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
	public int insert(Connection con, InquiryDTO dto) throws SQLException {
		PreparedStatement pstmt = null;
		int rowCount = 0;
		
		String sql = "insert into inquiry ( iq_code, category, shop_loc, shop_name, iq_title, iq_date, iq_content, member_id )"
				+ " values ( inquiry_seq.nextval, ?, ?, ?, ?, to_char(sysdate, 'YYYY-MM-DD'), ?, ? )";
		try {
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, dto.getCategory());
			pstmt.setString(2, dto.getShop_loc());
			pstmt.setString(3, dto.getShop_name());
			pstmt.setString(4, dto.getIq_title());
			pstmt.setString(5, dto.getIq_content());
			pstmt.setString(6, dto.getMember_id());

			rowCount = pstmt.executeUpdate();            
		}finally {
			JdbcUtil.close(pstmt);
		}
		return rowCount;
	}
	@Override
	public InquiryDTO selectOne(Connection con, int iq_code) throws SQLException {
		String sql ="SELECT * "
				+ "FROM inquiry "
				+ "WHERE IQ_CODE= ?";

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		InquiryDTO dto = null;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, iq_code);
			rs = pstmt.executeQuery();
			
			if ( rs.next() ) {
				dto = new InquiryDTO();
	
				dto.setIq_code(rs.getInt("iq_code"));
				dto.setMember_id(rs.getString("member_id"));
				dto.setCategory(rs.getString("category"));
				dto.setShop_loc(rs.getString("shop_loc"));
				dto.setShop_name(rs.getString("shop_name"));
				dto.setIq_title(rs.getString("iq_title"));
				dto.setIq_content(rs.getString("iq_content"));
				dto.setEmp_id(rs.getString("emp_id"));
			}		
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);         
		} // finally

		return dto;	
		
	}
	@Override
	public int update(Connection con, int iq_code, String emp_id) throws SQLException {
		String sql = "UPDATE inquiry "
				+ "SET "
				+ "EMP_ID = ? "
				+ "WHERE "
				+ "IQ_CODE = ? ";
		
		PreparedStatement pstmt = null;  
		int rowCount = 0;
		try {
	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, emp_id);
	         pstmt.setInt(2, iq_code);
	         rowCount = pstmt.executeUpdate();
	      } finally {
	         JdbcUtil.close(pstmt);
	      }
	      return rowCount;
	}
	
	@Override
	public List<InquiryDTO> selectAll(Connection con) throws SQLException {
		String sql =" select * "
				+ "from inquiry "
				+ "order by iq_code desc";
		
		ArrayList<InquiryDTO> list = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if ( rs.next() ) {
				list = new ArrayList<InquiryDTO>();
				InquiryDTO dto = null;
				do {
					dto =  new InquiryDTO();
					dto.setIq_code(rs.getInt("iq_code"));
					dto.setCategory(rs.getString("category"));
					dto.setShop_loc(rs.getString("shop_loc"));
					dto.setShop_name(rs.getString("shop_name"));
					dto.setIq_title(rs.getString("iq_title"));
					dto.setIq_date(rs.getDate("iq_date"));
					dto.setIq_content(rs.getString("iq_content"));
					dto.setEmp_id(rs.getString("emp_id"));
					dto.setMember_id(rs.getString("member_id"));
					
					list.add(dto);
				} while ( rs.next() );
			}//if
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);         
		} // finally

		return list;
	}
	
	
}
