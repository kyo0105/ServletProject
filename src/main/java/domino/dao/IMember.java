package domino.dao;

import java.sql.Connection;
import java.sql.SQLException;

import domino.dto.AgreeDTO;
import domino.dto.MemberDTO;

public interface IMember {
	
	// 1. 회원 로그인 정보
	MemberDTO loginAction(Connection con, String member_id) throws SQLException;
	
	// 2. 번호 인증
	int phoneAuth(Connection con, String tel) throws SQLException;
	
	// 3. 회원 ID 중복 체크
	int memberIdChk(Connection con, String member_id) throws SQLException;
	
	// 4. 회원 Email 중복 체크
	int memberEmailChk(Connection con, String email) throws SQLException;

	// 5. 회원가입
	void memberInsert(Connection con, MemberDTO mdto, AgreeDTO adto) throws SQLException;
}
