package domino.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.util.JdbcUtil;

import domino.dto.NoticeDTO;

public class NoticeDAO implements INotice{
	
	private NoticeDAO() {}
	private static NoticeDAO instance = new NoticeDAO();
	public static NoticeDAO getInstance() {
		return instance;
	}

	@Override
	public List<NoticeDTO> selectList(Connection con, String type, int currentPage, int numberPerPage)
			throws SQLException {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<NoticeDTO> list = null;
		NoticeDTO dto = null;
		
		String sql = "select * "
					+ "from (SELECT rank() over(order by seq desc) pageseq, m.*   "
					+ "      FROM ( select rank() over(order by notice_code) seq, notice.* "
					+ "  	         from notice "
					+ "	         where type=?) m "
					+ "      )t "
					+ "WHERE pageseq BETWEEN ? AND ?";

		int begin = (currentPage - 1) * numberPerPage + 1;
		int end = begin + numberPerPage - 1;

		try {
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, type);
			pstmt.setInt(2, begin);
			pstmt.setInt(3, end);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				list = new ArrayList<NoticeDTO>();
				
				do {
					dto = new NoticeDTO();
					
					dto.setSeq(rs.getInt("seq"));
					dto.setNotice_code(rs.getInt("notice_code"));
					dto.setTitle(rs.getString("title"));
					dto.setNotice_date(rs.getDate("notice_date"));
					dto.setHits(rs.getInt("hits"));
					dto.setContent(rs.getString("content"));
					dto.setType(rs.getString("type"));
					dto.setEmp_id(rs.getString("emp_id"));
					
					list.add(dto);
					
				} while (rs.next());
				
			} // if
			
		}  finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}

		return list;
	}

	@Override
	public int getTotalRecords(Connection con, String type) throws SQLException {
		
		String sql = "select count(*) totalRecords "
				+"from notice "
				+ "where type=?";

		int totalRecords = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, type);
			rs = pstmt.executeQuery();
			
			if (rs.next()) totalRecords = rs.getInt(1);
			
		} finally {
			JdbcUtil.close(rs);         
			JdbcUtil.close(pstmt);
		} 

		return totalRecords;
	}

	@Override
	public List<NoticeDTO> searchList(Connection con, String type, int currentPage, int numberPerPage,
			String searchCondition, String searchWord) throws SQLException {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<NoticeDTO> list = null;
		NoticeDTO dto = null;
		
		String sql = "select * "
				+ "from (SELECT rank() over(order by seq desc) pageseq, m.*   "
				+ "      FROM ( select rank() over(order by notice_code) seq, notice.* "
				+ "  	         from notice "
				+ "	         where type=? ";
		
		switch (searchCondition) {	// 검색 종류
		case "title":
			sql += " and regexp_like(title, ?, 'i') ";
			break;
		case "content":
			sql += " and regexp_like(content, ?, 'i') ";
			break;
		case "all":
			sql += " and ( regexp_like(title, ?, 'i') or regexp_like(content, ?, 'i') ) ";
			break;
		}
		sql += ") m "
			+ "      )t "
			+ "WHERE pageseq BETWEEN ? AND ?";
		

		int begin = (currentPage - 1) * numberPerPage + 1;
		int end = begin + numberPerPage -1;

		try {
			pstmt = con.prepareStatement(sql);

			if (searchCondition.equals("all")) {
				pstmt.setString(1, type);
				pstmt.setString(2, searchWord);
				pstmt.setString(3, searchWord);
				pstmt.setInt(4, begin);
				pstmt.setInt(5, end);
			} else {
				pstmt.setString(1, type);
				pstmt.setString(2, searchWord);
				pstmt.setInt(3, begin);
				pstmt.setInt(4, end);
			}

			rs = pstmt.executeQuery();

			if (rs.next()) {
				list = new ArrayList<NoticeDTO>();
				
				do {
					dto =  new NoticeDTO();
					
					dto.setSeq(rs.getInt("seq"));
					dto.setNotice_code(rs.getInt("notice_code"));
					dto.setTitle(rs.getString("title"));
					dto.setNotice_date(rs.getDate("notice_date"));
					dto.setHits(rs.getInt("hits"));
					dto.setContent(rs.getString("content"));
					dto.setType(rs.getString("type"));
					dto.setEmp_id(rs.getString("emp_id"));
					
					list.add(dto);
					
				} while (rs.next());
			}
			
		}  finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}

		return list;
	}

	@Override
	public int getTotalRecords(Connection con, String type, String searchCondition, String searchWord)
			throws SQLException {
		
		String sql = "select count(*) totalRecords "
					+ "from notice "
					+ "where type=?";
		
		switch (searchCondition) {	// 검색 종류
		case "title":
			sql += " and regexp_like(title, ?, 'i') ";
			break;
		case "content":
			sql += " and regexp_like(content, ?, 'i') ";
			break;
		case "all":
			sql += " and regexp_like(title, ?, 'i') or regexp_like(content, ?, 'i') ";
			break;
		}
		
		int totalRecords = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = con.prepareStatement(sql);
			if(searchCondition.equals("all")) {
				pstmt.setString(1, type);
				pstmt.setString(2, searchWord);
				pstmt.setString(3, searchWord);
			} else {
				pstmt.setString(1, type);
				pstmt.setString(2, searchWord);
			}
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) totalRecords = rs.getInt(1);
			
		} finally {
			JdbcUtil.close(rs);         
			JdbcUtil.close(pstmt);
		}

		return totalRecords;
	}

	@Override
	public List<NoticeDTO> selectView(Connection con, String type) throws SQLException {
		
		ArrayList<NoticeDTO> list = null;
		NoticeDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select rank() over (order by notice_code) seq, notice_code, title, notice_date, hits, "
		        + "replace(content, chr(10), '<br>') content, type, emp_id " 
		        + "from notice "
		        + "where type = ? "
		        + "order by seq desc";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, type);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				list = new ArrayList<NoticeDTO>();
				
				do {
					dto = new NoticeDTO();
					
					dto.setSeq(rs.getInt("seq"));
					dto.setNotice_code(rs.getInt("notice_code"));
					dto.setTitle(rs.getString("title"));
					dto.setNotice_date(rs.getDate("notice_date"));
					dto.setHits(rs.getInt("hits"));
					dto.setContent(rs.getString("content"));
					dto.setType(rs.getString("type"));
					dto.setEmp_id(rs.getString("emp_id"));
					list.add(dto);
					
				} while (rs.next());
				
			} 
			
		} finally {
			JdbcUtil.close(rs);         
			JdbcUtil.close(pstmt);
		} 

		return list;
	}


	@Override
	public List<NoticeDTO> searchView(Connection con, String type, String searchCondition, String searchWord)
			throws SQLException {
		
		ArrayList<NoticeDTO> list = null;
		NoticeDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select rank() over (order by notice_code) seq, notice_code, title, notice_date, hits, "
		        + "replace(content, chr(10), '<br>') content, type, emp_id " 
		        + "from notice "
		        + "where type = ? ";
		
		switch (searchCondition) {
		case "title":
			sql += "and regexp_like(title, ?, 'i')";
			break;
		case "content":
			sql += "and regexp_like(content, ?, 'i')";
			break;
		case "all":
			sql += "and ( regexp_like(title, ?, 'i') or regexp_like(content, ?, 'i') )";
			break;
		}
		

		try {
			pstmt = con.prepareStatement(sql);
			
			if(searchCondition.equals("all")) {
				pstmt.setString(1, type);
				pstmt.setString(2, searchWord);
				pstmt.setString(3, searchWord);

			}else {
				pstmt.setString(1, type);
				pstmt.setString(2, searchWord);
			}

			rs = pstmt.executeQuery();

			if (rs.next()) {
				list = new ArrayList<NoticeDTO>();
				do {
					dto =  new NoticeDTO();
					
					dto.setSeq(rs.getInt("seq"));
					dto.setNotice_code(rs.getInt("notice_code"));
					dto.setTitle(rs.getString("title"));
					dto.setNotice_date(rs.getDate("notice_date"));
					dto.setHits(rs.getInt("hits"));
					dto.setContent(rs.getString("content"));
					dto.setType(rs.getString("type"));
					dto.setEmp_id(rs.getString("emp_id"));
					
					list.add(dto);
					
				} while (rs.next());
			}
			
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		} 

		return list;
	}

	@Override
	public int updateHits(Connection con, int notice_code) throws SQLException {
		
		PreparedStatement pstmt = null;      
		int rowCount = 0;
		
		String sql = "update notice "
				  + " set hits = hits + 1 "
				  + " where notice_code = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, notice_code);
			rowCount = pstmt.executeUpdate();
			
		} finally {
			JdbcUtil.close(pstmt);
		}
		
		return rowCount;  
	}
	
	@Override
	public int insert(Connection con, NoticeDTO dto) throws SQLException {
		
		PreparedStatement pstmt = null;
		int rowCount = 0;

		String sql = "insert into notice ( notice_code, title, notice_date, hits, content, type, emp_id)"
				  + " values ( notice_seq.nextval, ?, to_char(sysdate, 'YYYY-MM-DD'), 0, ?, ?, ? )";

		try {
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getType());
			pstmt.setString(4, dto.getEmp_id());

			rowCount = pstmt.executeUpdate();           
			
		}finally {
			JdbcUtil.close(pstmt);
		}
		
		return rowCount;
	}

	@Override
	public int delete(Connection con, int notice_code) throws SQLException {
		
		PreparedStatement pstmt = null;

		String sql = "DELETE FROM notice WHERE notice_code = ?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, notice_code);

			return pstmt.executeUpdate();	
			
		} finally {
			JdbcUtil.close(pstmt);
		}
	
	}

	@Override
	public int update(Connection con, NoticeDTO dto) throws SQLException {
		
		PreparedStatement pstmt = null;
		int rowCount = 0;

		String sql = "update notice "
				+ "set title=?, content=?, emp_id=? "
				+ "where notice_code=?";
		
		try {
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, dto.getTitle()) ;
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getEmp_id());
			pstmt.setInt(4, dto.getNotice_code());

			rowCount = pstmt.executeUpdate();
			
		} finally {
			JdbcUtil.close(pstmt);
		}
		
		return rowCount;
	}

	@Override
	public NoticeDTO selectOne(Connection con, int notice_code) throws SQLException {

		PreparedStatement pstmt = null;
		ResultSet rs = null;      
		NoticeDTO dto = null;
		
		String sql = "select * from notice where notice_code = ?";
		
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, notice_code);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				dto =  new NoticeDTO();

				dto.setNotice_code(rs.getInt("notice_code"));
				dto.setTitle(rs.getString("title"));
				dto.setNotice_date(rs.getDate("notice_date"));
				dto.setHits(rs.getInt("hits"));
				dto.setContent(rs.getString("content"));
				dto.setType(rs.getString("type"));
				dto.setEmp_id(rs.getString("emp_id"));
			}
			
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}

		return dto;
	}



}
