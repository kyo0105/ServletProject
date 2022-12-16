package domino.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.util.JdbcUtil;

import domino.dto.AgreeDTO;
import domino.dto.MemberDTO;

public class MemberDAO implements IMember {
	
	private MemberDAO() {}
	private static MemberDAO instance = new MemberDAO();
	public static MemberDAO getInstance() {
		return instance;
	}
	
	@Override
	public MemberDTO loginAction(Connection con, String member_id) throws SQLException {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberDTO dto = null;
		 
		String sql = "select * from member where member_id = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member_id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				dto = new MemberDTO();
						
				dto.setMember_id( rs.getString("member_id") );
				dto.setName( rs.getString("name") );
				dto.setPw( rs.getString("pw") );
				dto.setBirth_type( rs.getInt("birth_type"));
				dto.setBirth( rs.getDate("birth") );
				dto.setTel( rs.getString("tel") );
				dto.setEmail( rs.getString("email") );
				dto.setGender( rs.getString("gender") );
				dto.setMania_rank( rs.getString("mania_rank") );
				dto.setSns_pan( rs.getInt("sns_pan"));
				dto.setJoin_date( rs.getDate("join_date") );			
			}
			
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		
		return dto;
	}

	@Override
	public int phoneAuth(Connection con, String tel) throws SQLException {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int memberRecorde = 0;
		
		String sql = "select count(*) memberRecorde from member where tel = ?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, tel);
			rs = pstmt.executeQuery();
			
			if (rs.next()) memberRecorde = rs.getInt(1);
			
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		
		return memberRecorde;
	}

	@Override
	public int memberIdChk(Connection con, String member_id) throws SQLException {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int idChk = 0;
		
		String sql = "select count(*) idCount from member where member_id = ?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member_id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) idChk = rs.getInt(1);
			
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		
		return idChk;
	}

	@Override
	public int memberEmailChk(Connection con, String email) throws SQLException {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int emailChk = 0;
		
		String sql = "select count(*) idCount from member where email = ?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			
			if (rs.next()) emailChk = rs.getInt(1);
			
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		
		return emailChk;
	}

	@Override
	public void memberInsert(Connection con, MemberDTO mdto, AgreeDTO adto) throws SQLException {
	
		PreparedStatement pstmtM = null, pstmtA = null;

		String sqlMember = "insert into member "
				  	 	 + "values ( ?, ?, ?, ?, ?, ?, ?, ?, ?, 'regular', ?, to_char(sysdate, 'yyyy-mm-d') )";
		
		// 약관 동의
		String sqlAgree = "insert into agree values( ?, ?, ?, ? )";
		
		try {
			pstmtM = con.prepareStatement(sqlMember);
			pstmtA = con.prepareStatement(sqlAgree);
			
			pstmtM.setString(1, mdto.getMember_id());
			pstmtM.setString(2, mdto.getName());
			pstmtM.setString(3, mdto.getPw());
			pstmtM.setInt(4, mdto.getBirth_type());
			pstmtM.setDate(5, mdto.getBirth());
			pstmtM.setString(6, mdto.getTel());
			pstmtM.setString(7, mdto.getEmail());
			pstmtM.setString(8, mdto.getGender());
			pstmtM.setInt(9, mdto.getInfo_date());
			pstmtM.setInt(10, mdto.getSns_pan() );
				
			pstmtM.executeUpdate();
			
			pstmtA.setString(1, adto.getMember_id());
			pstmtA.setInt(2, adto.getMessage());
			pstmtA.setInt(3, adto.getEmail());
			pstmtA.setInt(4, adto.getMail());
			
			pstmtA.executeUpdate();
			
		} finally {
			JdbcUtil.close(pstmtM);
			JdbcUtil.close(pstmtA);
		}
		
	}

}
